$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v6.2.1/PowerShell-6.2.1-win-x86.zip'
    checksum       = 'F8A713A2614603267683F463B75CE9A81756107F0C927F198BBDD747ACB10AC0'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v6.2.1/PowerShell-6.2.1-win-x64.zip'
    checksum64     = '6BCC0F80CA549A8ADB317B2EC1294F103C4BF75CC29EFA8AC03A27F9A860B1F4'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
