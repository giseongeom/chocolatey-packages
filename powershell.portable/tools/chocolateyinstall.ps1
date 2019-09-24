$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v6.2.3/PowerShell-6.2.3-win-x86.zip'
    checksum       = '6b9f1c54755aa51678e56a6059c2747801b3e0c72e678b800b15c8e084129c66'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v6.2.3/PowerShell-6.2.3-win-x64.zip'
    checksum64     = 'af171ed197b167e2630044dba6344af8b291e8646f7276b63f1d84c166a41d33'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
