$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.0.2/PowerShell-7.0.2-win-x86.zip'
    checksum       = '1C7D66E3C974A85B8D14FB80ACDF71E28B745C203A581CAA95071340F43B90B0'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v7.0.2/PowerShell-7.0.2-win-x64.zip'
    checksum64     = '3AC28C2E9BA08A3A6D705CBA90485D1F4D0DC7A58A96F7EC7947C95F61D1CB7A'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
