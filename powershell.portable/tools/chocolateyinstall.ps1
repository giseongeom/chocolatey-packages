$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.4/PowerShell-6.0.4-win-x86.zip'
    checksum       = '787FBECBA57CD385428DBF4F4A0B7E16F92EECEE3E6ADAE65D1AB04CA8CF41DD'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.4/PowerShell-6.0.4-win-x64.zip'
    checksum64     = '0B04B63D2B63D4631CF5BD6E531F26B60F3CC1B1DB41C8B5360F14776E66F797'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
