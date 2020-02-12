$ErrorActionPreference = 'Stop'; # stop on all errors
# CreateCmdOpenHere.ps1
# Write registry keys to add a 'Cmd Here' option to the Windows Explorer right click menu.
# Most of codes are borrowed from https://chocolatey.org/packages/PowerShellHere

$packageName   = 'ubuntuhere'
$iconUrl       = 'https://rawcdn.githack.com/giseongeom/chocolatey-packages/022e27cdebbc4f8f02d91ee12fb5b2eb932465d7/ubuntuhere/ubuntuhere.ico'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$iconFullPath  = Join-Path $toolsDir "$packageName.ico"

# Install icon
Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $iconFullPath -url $iconUrl
$cmdpath = "wsl.exe --cd"

# for right clicking on folders
New-Item HKLM:\SOFTWARE\Classes\Directory\shell\UbuntuOpenHere -force
Set-Item HKLM:\SOFTWARE\Classes\Directory\shell\UbuntuOpenHere "Open WSL/Ubuntu Here"
New-item HKLM:\SOFTWARE\Classes\Directory\shell\UbuntuOpenHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Directory\shell\UbuntuOpenHere\command "$cmdpath `"%V`""
New-ItemProperty -Path HKLM:\SOFTWARE\Classes\Directory\shell\UbuntuOpenHere -Name Icon -Value "$iconFullPath" -Force

# for right clicking on drives
New-Item HKLM:\SOFTWARE\Classes\Drive\shell\UbuntuOpenHere -force
Set-Item HKLM:\SOFTWARE\Classes\Drive\shell\UbuntuOpenHere "Open WSL/Ubuntu Here"
New-item HKLM:\SOFTWARE\Classes\Drive\shell\UbuntuOpenHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Drive\shell\UbuntuOpenHere\command "$cmdpath `"%V`""
New-ItemProperty -Path HKLM:\SOFTWARE\Classes\Drive\shell\UbuntuOpenHere -Name Icon -Value "$iconFullPath" -Force

# for right clicking on the background of folders
New-Item HKLM:\SOFTWARE\Classes\Directory\Background\shell\UbuntuOpenHere -force
Set-Item HKLM:\SOFTWARE\Classes\Directory\Background\shell\UbuntuOpenHere "Open WSL/Ubuntu Here"
New-item HKLM:\SOFTWARE\Classes\Directory\Background\shell\UbuntuOpenHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Directory\Background\shell\UbuntuOpenHere\command "$cmdpath `"%V`""
New-ItemProperty -Path HKLM:\SOFTWARE\Classes\Directory\Background\shell\UbuntuOpenHere -Name Icon -Value "$iconFullPath" -Force
