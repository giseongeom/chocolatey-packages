$ErrorActionPreference = 'Stop'; # stop on all errors
# Most of codes are borrowed from https://chocolatey.org/packages/PowerShellHere

$packageName   = 'cmdhere'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$iconFullPath  = Join-Path $toolsDir "$packageName.ico"
Remove-Item -Path $iconFullPath -Force


# for right clicking on folders
Remove-Item -Recurse HKLM:\SOFTWARE\Classes\Directory\shell\CmdOpenHere -force
 
# for right clicking on drives
Remove-Item -Recurse HKLM:\SOFTWARE\Classes\Drive\shell\CmdOpenHere -force
 
# for right clicking on the background of folders
Remove-Item -Recurse HKLM:\SOFTWARE\Classes\Directory\Background\shell\CmdOpenHere -force
