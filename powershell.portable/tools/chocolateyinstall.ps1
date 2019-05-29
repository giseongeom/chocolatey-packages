$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v6.2.0/PowerShell-6.2.0-win-x86.zip'
    checksum       = 'DAE9D3D2AD332A82312D2DAFA398287670FB5CBB94128C80D422E1F3679F8EB2'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v6.2.0/PowerShell-6.2.0-win-x64.zip'
    checksum64     = 'C02AF438D3BC8DC61815110C99189A694ED161E64C64A59B49AB01D945DFC73A'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
