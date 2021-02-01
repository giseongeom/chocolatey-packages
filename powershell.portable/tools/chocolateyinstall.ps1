$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.1/PowerShell-7.1.1-win-x86.zip'
    checksum       = '14663E4644616C3B79EABFB95FAE7B7C013C5903DB5A2DC70D014EAAA50E072C'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.1/PowerShell-7.1.1-win-x64.zip'
    checksum64     = '9C1E35A11BC1BF379497F8998067E7E5C213E3B447E0DD2CC731C9374DB8AEF9'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
