$ErrorActionPreference = 'Stop'; # stop on all errors
# CreateCmdOpenHere.ps1
# Write registry keys to add a 'Cmd Here' option to the Windows Explorer right click menu.
# Most of codes are borrowed from https://chocolatey.org/packages/PowerShellHere

$packageName   = 'cmdhere'
$iconUrl       = 'https://cdn.rawgit.com/giseongeom/chocolatey-packages/4deaa6b1/cmdhere/cmdhere.ico'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$iconFullPath  = Join-Path $toolsDir "$packageName.ico"

# Install icon
Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $iconFullPath -url $iconUrl


$cmdpath = "cmd.exe /s /k pushd"

# for right clicking on folders
New-Item HKLM:\SOFTWARE\Classes\Directory\shell\CmdOpenHere -force
Set-Item HKLM:\SOFTWARE\Classes\Directory\shell\CmdOpenHere "Open Command Prompt Here"
New-item HKLM:\SOFTWARE\Classes\Directory\shell\CmdOpenHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Directory\shell\CmdOpenHere\command "$cmdpath `"%V`""
New-ItemProperty -Path HKLM:\SOFTWARE\Classes\Directory\shell\CmdOpenHere -Name Icon -Value "$iconFullPath" -Force
 
# for right clicking on drives
New-Item HKLM:\SOFTWARE\Classes\Drive\shell\CmdOpenHere -force
Set-Item HKLM:\SOFTWARE\Classes\Drive\shell\CmdOpenHere "Open Command Prompt Here"
New-item HKLM:\SOFTWARE\Classes\Drive\shell\CmdOpenHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Drive\shell\CmdOpenHere\command "$cmdpath `"%V`""
New-ItemProperty -Path HKLM:\SOFTWARE\Classes\Drive\shell\CmdOpenHere -Name Icon -Value "$iconFullPath" -Force
 
# for right clicking on the background of folders
New-Item HKLM:\SOFTWARE\Classes\Directory\Background\shell\CmdOpenHere -force
Set-Item HKLM:\SOFTWARE\Classes\Directory\Background\shell\CmdOpenHere "Open Command Prompt Here"
New-item HKLM:\SOFTWARE\Classes\Directory\Background\shell\CmdOpenHere\command -force
Set-item HKLM:\SOFTWARE\Classes\Directory\Background\shell\CmdOpenHere\command "$cmdpath"
New-ItemProperty -Path HKLM:\SOFTWARE\Classes\Directory\Background\shell\CmdOpenHere -Name Icon -Value "$iconFullPath" -Force

