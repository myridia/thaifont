$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Url = 'https://github.com/myridia/thaifont/releases/download/main/Myridia-Normal.otf'
$Tmp = Join-Path $env:TEMP 'Myridia-Normal.otf'

Invoke-WebRequest -Uri $Url -OutFile $Tmp

$Shell = New-Object -ComObject Shell.Application
$Shell.Namespace(0x14).CopyHere($Tmp, 16)

Remove-Item $Tmp -ErrorAction SilentlyContinue
Write-Host 'Installed Myridia. Restart apps that cache fonts.'