#!/usr/bin/env python3
"""Convierte la Fjelstul World Cup Database (CSV) en hechos Prolog.

Solo considera los mundiales masculinos (1930-2022). Genera un archivo .pl por
tema en prolog/kb/. Esos archivos son generados: las correcciones o datos
nuevos se agregan en prolog/kb_manual.pl, no acá.

Uso:
    python3 scripts/csv_a_prolog.py
    python3 scripts/csv_a_prolog.py --datos data/raw --salida prolog/kb
"""

import argparse
import csv
import sys
import unicodedata
from collections import Counter, defaultdict
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent
NO_APLICA = "not applicable"

FASES = {
    "group stage": "fase_grupos",
    "second group stage": "segunda_fase_grupos",
    "final round": "ronda_final",
    "round of 16": "octavos",
    "quarter-finals": "cuartos",
    "semi-finals": "semifinal",
    "third-place match": "tercer_puesto",
    "final": "final",
}

PREMIOS = {
    "Golden Ball": "balon_de_oro",
    "Silver Ball": "balon_de_plata",
    "Bronze Ball": "balon_de_bronce",
    "Golden Boot": "bota_de_oro",
    "Silver Boot": "bota_de_plata",
    "Bronze Boot": "bota_de_bronce",
    "Golden Glove": "guante_de_oro",
    "Best Young Player": "mejor_jugador_joven",
}

# Orden de prioridad cuando un jugador tiene más de una posición registrada.
POSICIONES = [
    ("forward", "delantero"),
    ("midfielder", "mediocampista"),
    ("defender", "defensa"),
    ("goal_keeper", "arquero"),
]

# Letras que NFKD no descompone en letra base + tilde.
TRANSLITERACION = str.maketrans({
    "ß": "ss", "ø": "o", "Ø": "o", "æ": "ae", "Æ": "ae", "œ": "oe",
    "ł": "l", "Ł": "l", "đ": "d", "Đ": "d", "ð": "d", "þ": "th", "ı": "i",
})

ENCABEZADO = """\
% =============================================================
% ARCHIVO GENERADO por scripts/csv_a_prolog.py. NO EDITAR A MANO.
% Fuente: Fjelstul World Cup Database v1.2.0, (c) 2023 Joshua C.
% Fjelstul, Ph.D., CC-BY-SA 4.0. Ver data/raw/FUENTE.md.
% =============================================================
"""


# ---------------------------------------------------------------
# Utilidades de formato Prolog
# ---------------------------------------------------------------

def slug(texto):
    """'Alemania Occidental' -> 'alemania_occidental'."""
    texto = texto.translate(TRANSLITERACION)
    texto = unicodedata.normalize("NFKD", texto)
    texto = "".join(c for c in texto if not unicodedata.combining(c))
    separado = "".join(c if c.isascii() and c.isalnum() else " " for c in texto.lower())
    texto = "_".join(separado.split())
    if not texto or not texto[0].isalpha():
        texto = "x_" + texto
    return texto


def atomo(valor):
    """Escribe un átomo, entre comillas si no es un identificador simple."""
    if valor.isascii() and valor[:1].islower() and valor.replace("_", "").isalnum():
        return valor
    return "'" + valor.replace("\\", "\\\\").replace("'", "\\'") + "'"


def cadena(valor):
    return '"' + valor.replace("\\", "\\\\").replace('"', '\\"') + '"'


def fecha(iso):
    anio, mes, dia = (int(x) for x in iso.split("-"))
    return f"date({anio},{mes},{dia})"


def hecho(predicado, *args):
    return f"{predicado}({', '.join(str(a) for a in args)})."


def leer_csv(directorio, nombre):
    with open(directorio / f"{nombre}.csv", encoding="utf-8", newline="") as f:
        return list(csv.DictReader(f))


def escribir_pl(ruta, descripcion, firmas, secciones):
    """firmas: ['partido/7', ...]; secciones: [(comentario, [lineas])]."""
    partes = [ENCABEZADO, f"% {descripcion}\n"]
    for firma in firmas:
        partes.append(f":- dynamic({firma}).\n")
    for comentario, lineas in secciones:
        partes.append(f"\n% {comentario}\n")
        partes.append("\n".join(lineas) + "\n")
    ruta.write_text("".join(partes), encoding="utf-8")


# ---------------------------------------------------------------
# Conversión
# ---------------------------------------------------------------

class Conversor:
    def __init__(self, datos, manual):
        self.datos = datos
        torneos = leer_csv(datos, "tournaments")
        self.torneos = [t for t in torneos if "Men's" in t["tournament_name"]]
        self.ids_torneo = {t["tournament_id"] for t in self.torneos}
        self.partidos = self._filtrar("matches")
        self.goles = self._filtrar("goals")
        self.premios = self._filtrar("award_winners")
        self.posiciones = self._filtrar("tournament_standings")
        self.sedes = self._filtrar("host_countries")
        self.equipos = self._mapear_equipos(manual)
        self.jugadores = self._mapear_jugadores()

    def _filtrar(self, nombre):
        return [r for r in leer_csv(self.datos, nombre)
                if r["tournament_id"] in self.ids_torneo]

    def _mapear_equipos(self, manual):
        """team_id -> (átomo, nombre en español, confederación)."""
        traduccion = {r["team_name"]: r["nombre_es"]
                      for r in leer_csv(manual, "equipos_es")}
        usados = ({p["home_team_id"] for p in self.partidos}
                  | {p["away_team_id"] for p in self.partidos}
                  | {s["team_id"] for s in self.sedes})
        equipos, faltantes = {}, []
        for e in leer_csv(self.datos, "teams"):
            if e["team_id"] not in usados:
                continue
            nombre = traduccion.get(e["team_name"])
            if nombre is None:
                faltantes.append(e["team_name"])
                continue
            equipos[e["team_id"]] = (slug(nombre), nombre,
                                     e["confederation_code"].lower())
        if faltantes:
            sys.exit(f"Faltan traducciones en equipos_es.csv: {faltantes}")
        repetidos = [a for a, n in Counter(v[0] for v in equipos.values()).items() if n > 1]
        if repetidos:
            sys.exit(f"Átomos de equipo repetidos: {repetidos}")
        return equipos

    def _mapear_jugadores(self):
        """player_id -> (átomo, nombre visible, posición).

        Solo jugadores que marcaron un gol o ganaron un premio individual.
        """
        usados = {g["player_id"] for g in self.goles} | {p["player_id"] for p in self.premios}
        filas = sorted((p for p in leer_csv(self.datos, "players") if p["player_id"] in usados),
                       key=lambda p: p["player_id"])
        if len(filas) != len(usados):
            sys.exit("Hay goles o premios con player_id que no está en players.csv")

        def nombre_visible(p):
            if p["given_name"] == NO_APLICA:
                return p["family_name"]
            return f'{p["given_name"]} {p["family_name"]}'

        # Si dos jugadores comparten nombre, se desambigua con el año de nacimiento.
        conteo = Counter(slug(nombre_visible(p)) for p in filas)
        jugadores, tomados = {}, set()
        for p in filas:
            base = slug(nombre_visible(p))
            at = base if conteo[base] == 1 else f'{base}_{p["birth_date"][:4]}'
            while at in tomados:
                at += "_b"
            tomados.add(at)
            posicion = next((es for col, es in POSICIONES if p[col] == "1"), "desconocida")
            jugadores[p["player_id"]] = (at, nombre_visible(p), posicion)
        return jugadores

    def equipo(self, team_id):
        return self.equipos[team_id][0]

    def jugador(self, player_id):
        return self.jugadores[player_id][0]

    @staticmethod
    def id_partido(match_id):
        return slug(match_id)  # M-1930-01 -> m_1930_01

    @staticmethod
    def anio(tournament_id):
        return int(tournament_id.split("-")[1])

    # --- archivos -------------------------------------------------

    def torneos_pl(self, salida):
        torneos = [hecho("torneo", t["year"], t["count_teams"])
                   for t in sorted(self.torneos, key=lambda t: int(t["year"]))]
        sedes = sorted(hecho("sede", self.anio(s["tournament_id"]), self.equipo(s["team_id"]))
                       for s in self.sedes)
        posiciones = [hecho("posicion_final", self.anio(p["tournament_id"]), p["position"],
                            self.equipo(p["team_id"]))
                      for p in sorted(self.posiciones,
                                      key=lambda p: (p["tournament_id"], int(p["position"])))]
        escribir_pl(salida / "torneos.pl", "Torneos, sedes y posiciones finales (1° a 4°).",
                    ["torneo/2", "sede/2", "posicion_final/3"], [
                        ("torneo(Anio, CantidadEquipos).", torneos),
                        ("sede(Anio, Equipo): el país anfitrión. 2002 tiene dos.", sedes),
                        ("posicion_final(Anio, Posicion, Equipo).", posiciones),
                    ])
        return len(torneos)

    def equipos_pl(self, salida):
        lineas = sorted(hecho("equipo", at, cadena(nombre), conf)
                        for at, nombre, conf in self.equipos.values())
        escribir_pl(salida / "equipos.pl", "Selecciones que jugaron al menos un mundial masculino.",
                    ["equipo/3"], [("equipo(Equipo, Nombre, Confederacion).", lineas)])
        return len(lineas)

    def partidos_pl(self, salida):
        partidos, grupos, fechas, lugares = [], [], [], []
        alargues, penales, repetidos, repeticiones = [], [], [], []
        fases_desconocidas = {p["stage_name"] for p in self.partidos} - FASES.keys()
        if fases_desconocidas:
            sys.exit(f"Fases sin traducir: {fases_desconocidas}")

        for p in sorted(self.partidos, key=lambda p: p["match_id"]):
            pid = self.id_partido(p["match_id"])
            partidos.append(hecho("partido", pid, self.anio(p["tournament_id"]),
                                  FASES[p["stage_name"]],
                                  self.equipo(p["home_team_id"]), self.equipo(p["away_team_id"]),
                                  p["home_team_score"], p["away_team_score"]))
            if p["group_name"] != NO_APLICA:
                grupos.append(hecho("partido_grupo", pid, slug(p["group_name"])))
            fechas.append(hecho("partido_fecha", pid, fecha(p["match_date"])))
            lugares.append(hecho("partido_lugar", pid, cadena(p["stadium_name"]),
                                 cadena(p["city_name"])))
            if p["extra_time"] == "1":
                alargues.append(hecho("alargue", pid))
            if p["penalty_shootout"] == "1":
                penales.append(hecho("penales", pid, p["home_team_score_penalties"],
                                     p["away_team_score_penalties"]))
            if p["replayed"] == "1":
                repetidos.append(hecho("repetido", pid))
            if p["replay"] == "1":
                repeticiones.append(hecho("repeticion", pid))

        escribir_pl(salida / "partidos.pl", "Partidos. Los goles incluyen el alargue; los penales van aparte.",
                    ["partido/7", "partido_grupo/2", "partido_fecha/2", "partido_lugar/3",
                     "alargue/1", "penales/3", "repetido/1", "repeticion/1"], [
                        ("partido(Id, Anio, Fase, Local, Visita, GolesLocal, GolesVisita).", partidos),
                        ("partido_grupo(Id, Grupo).", grupos),
                        ("partido_fecha(Id, date(A,M,D)).", fechas),
                        ("partido_lugar(Id, Estadio, Ciudad).", lugares),
                        ("alargue(Id): el partido se fue a tiempo extra.", alargues),
                        ("penales(Id, PenalesLocal, PenalesVisita).", penales),
                        ("repetido(Id): terminó empatado y se volvió a jugar (1934-1938).", repetidos),
                        ("repeticion(Id): es el partido de desempate.", repeticiones),
                    ])
        return len(partidos)

    def goles_pl(self, salida):
        lineas = []
        for g in sorted(self.goles, key=lambda g: g["goal_id"]):
            minuto = g["minute_regulation"]
            if g["minute_stoppage"] != "0":
                minuto = f'{minuto}+{g["minute_stoppage"]}'
            if g["own_goal"] == "1":
                tipo = "autogol"
            elif g["penalty"] == "1":
                tipo = "penal"
            else:
                tipo = "normal"
            lineas.append(hecho("gol", self.id_partido(g["match_id"]), self.jugador(g["player_id"]),
                                self.equipo(g["player_team_id"]), minuto, tipo))
        escribir_pl(salida / "goles.pl",
                    "Goles. Equipo es la selección del jugador: en un autogol, el gol cuenta para el rival.",
                    ["gol/5"], [("gol(Partido, Jugador, EquipoDelJugador, Minuto, Tipo). "
                                 "Tipo: normal | penal | autogol. Minuto: 90+3 = minuto 90, 3 de descuento.",
                                 lineas)])
        return len(lineas)

    def jugadores_pl(self, salida):
        lineas = sorted(hecho("jugador", at, cadena(nombre), pos)
                        for at, nombre, pos in self.jugadores.values())
        escribir_pl(salida / "jugadores.pl", "Jugadores que marcaron al menos un gol o ganaron un premio.",
                    ["jugador/3"], [("jugador(Jugador, Nombre, Posicion).", lineas)])
        return len(lineas)

    def premios_pl(self, salida):
        desconocidos = {p["award_name"] for p in self.premios} - PREMIOS.keys()
        if desconocidos:
            sys.exit(f"Premios sin traducir: {desconocidos}")
        lineas = [hecho("premio", self.anio(p["tournament_id"]), PREMIOS[p["award_name"]],
                        self.jugador(p["player_id"]))
                  for p in sorted(self.premios, key=lambda p: int(p["key_id"]))]
        escribir_pl(salida / "premios.pl", "Premios individuales. Un premio compartido aparece varias veces.",
                    ["premio/3"], [("premio(Anio, Premio, Jugador).", lineas)])
        return len(lineas)

    def validar(self):
        """Chequeos de consistencia entre tablas antes de escribir."""
        ids = {p["match_id"] for p in self.partidos}
        huerfanos = [g["goal_id"] for g in self.goles if g["match_id"] not in ids]
        if huerfanos:
            sys.exit(f"Goles sin partido: {huerfanos[:5]}")
        # Los goles de cada partido deben cuadrar con el marcador.
        por_equipo = defaultdict(int)
        for g in self.goles:
            por_equipo[(g["match_id"], g["team_id"])] += 1
        descuadres = [p["match_id"] for p in self.partidos
                      if por_equipo[(p["match_id"], p["home_team_id"])] != int(p["home_team_score"])
                      or por_equipo[(p["match_id"], p["away_team_id"])] != int(p["away_team_score"])]
        return descuadres


def main():
    parser = argparse.ArgumentParser(
        description="Convierte la Fjelstul World Cup Database (CSV) en hechos Prolog.")
    parser.add_argument("--datos", type=Path, default=RAIZ / "data" / "raw")
    parser.add_argument("--manual", type=Path, default=RAIZ / "data" / "manual")
    parser.add_argument("--salida", type=Path, default=RAIZ / "prolog" / "kb")
    args = parser.parse_args()
    args.salida.mkdir(parents=True, exist_ok=True)

    conv = Conversor(args.datos, args.manual)
    descuadres = conv.validar()
    resumen = {
        "torneos": conv.torneos_pl(args.salida),
        "equipos": conv.equipos_pl(args.salida),
        "partidos": conv.partidos_pl(args.salida),
        "goles": conv.goles_pl(args.salida),
        "jugadores": conv.jugadores_pl(args.salida),
        "premios": conv.premios_pl(args.salida),
    }
    for clave, n in resumen.items():
        print(f"{clave:>10}: {n}")
    if descuadres:
        print(f"AVISO: {len(descuadres)} partidos con goles que no cuadran con el marcador: "
              f"{descuadres[:10]}")
    print(f"Archivos escritos en {args.salida}")


if __name__ == "__main__":
    main()
