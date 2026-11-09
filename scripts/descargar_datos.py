"""Descargar la versión fijada de las 27 tablas y su diccionario de datos."""

import hashlib
import json
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from urllib.request import urlopen

ROOT = Path(__file__).resolve().parents[1]


def git_sha(contenido):
    return hashlib.sha1(b"blob " + str(len(contenido)).encode() + b"\0" + contenido).hexdigest()


def descargar(archivo, fuente):
    destino = ROOT / archivo["destino"]
    if destino.exists():
        if git_sha(destino.read_bytes()) != archivo["sha1"]:
            raise ValueError(f"{destino} contiene cambios locales; no se sobrescribirá.")
        return
    url = (f"https://raw.githubusercontent.com/{fuente['repositorio']}/"
           f"{fuente['commit']}/{archivo['origen']}")
    with urlopen(url, timeout=60) as response:
        contenido = response.read()
    if git_sha(contenido) != archivo["sha1"]:
        raise ValueError(f"La descarga de {archivo['origen']} no coincide con la fuente fijada.")
    destino.parent.mkdir(parents=True, exist_ok=True)
    temporal = destino.with_suffix(destino.suffix + ".tmp")
    temporal.write_bytes(contenido)
    temporal.replace(destino)


def main():
    fuente = json.loads((ROOT / "data/fuente.json").read_text())
    with ThreadPoolExecutor(max_workers=4) as pool:
        list(pool.map(lambda archivo: descargar(archivo, fuente), fuente["archivos"]))
    print("27 tablas y diccionario de datos verificados contra " + fuente["commit"])


if __name__ == "__main__":
    main()
