$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$PSVersion = '7.1.3'

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = "https://github.com/PowerShell/PowerShell/releases/download/v$PSVersion/PowerShell-$PSVersion-win-x86.zip"
    checksum       = 'ECFD51545084D9B791874062C39EB0C7C7DD2991265EE7F4DC5064995A614E6C'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = "https://github.com/PowerShell/PowerShell/releases/download/v$PSVersion/PowerShell-$PSVersion-win-x64.zip"
    checksum64     = '47475F1D4015704F3FB5F6D2CF61196D121ABA60C19592B04BE818317CE01039'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
