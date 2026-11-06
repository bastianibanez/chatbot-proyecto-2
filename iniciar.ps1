# Ejecutar desde PowerShell: .\iniciar.ps1
Set-Location $PSScriptRoot
if (-not (Get-Command swipl -ErrorAction SilentlyContinue)) {
    $ruta = 'C:\Program Files\swipl\bin\swipl.exe'
    if (Test-Path $ruta) { & $ruta -q -s prolog/servidor.pl -g iniciar }
    else { Write-Error 'Instala SWI-Prolog o agrega su carpeta bin al PATH.' }
} else { swipl -q -s prolog/servidor.pl -g iniciar }
