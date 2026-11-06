"""Ejecuta el motor real Prolog y guarda respuestas reproducibles para el informe."""
import json
import shutil
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SWIPL = shutil.which('swipl')
if not SWIPL:
    raise SystemExit('Instala SWI-Prolog y agrega swipl al PATH.')
CASOS = json.loads((ROOT / 'pruebas/casos.json').read_text(encoding='utf-8'))
RESULTADOS = []
for caso in CASOS:
    # La entrada viaja por stdin; no se evalúa como código Prolog.
    p = subprocess.run([SWIPL, '-q', '-s', str(ROOT/'prolog/chatbot.pl'), '-g',
        'read_line_to_string(user_input,P),responder(P,R),json_write_dict(current_output,R),halt'],
        input=caso['pregunta']+'\n', capture_output=True, text=True, encoding='utf-8', timeout=15)
    if p.returncode:
        raise SystemExit(p.stderr)
    respuesta = json.loads(p.stdout)
    ok = respuesta['estado'] == 'ok' and caso['esperado'] in respuesta['respuesta']
    RESULTADOS.append(dict(caso, **respuesta, correcto=ok))
    print(('OK' if ok else 'FALLO') + ' · ' + caso['pregunta'])
( ROOT/'pruebas/resultados.json').write_text(json.dumps(RESULTADOS,ensure_ascii=False,indent=2),encoding='utf-8')
print(f"{sum(r['correcto'] for r in RESULTADOS)}/{len(RESULTADOS)} casos correctos")
raise SystemExit(0 if all(r['correcto'] for r in RESULTADOS) else 1)
