# Ejecutar desde PowerShell: .\iniciar.ps1
Set-Location $PSScriptRoot
$pythonPath = Join-Path $PSScriptRoot '.venv\Scripts\python.exe'
if (-not (Test-Path $pythonPath)) {
    Write-Error 'Crea el entorno: python -m venv .venv; luego instala requirements.txt con ese Python.'
    exit 1
}
if (-not (Get-Command swipl -ErrorAction SilentlyContinue)) {
    $prologBin = 'C:\Program Files\swipl\bin'
    if (Test-Path (Join-Path $prologBin 'swipl.exe')) { $env:PATH = "$prologBin;$env:PATH" }
    else { Write-Error 'Instala SWI-Prolog y agrega su carpeta bin al PATH.'; exit 1 }
}
& $pythonPath -m uvicorn backend.main:app --host 127.0.0.1 --port 8000
