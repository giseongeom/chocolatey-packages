$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.0.1/PowerShell-7.0.1-win-x86.zip'
    checksum       = '1478777c68b489574cc98b4041a6dc87330ffd2c14d91970d86b7d1b27d377ea'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v7.0.1/PowerShell-7.0.1-win-x64.zip'
    checksum64     = '0ce5e2c20c773e54f931adc60c77f599ca90c25b14f53fdbded19572847b45c7'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
