$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.1/PowerShell-6.1.1-win-x86.zip'
    checksum       = '1C7146E3879EAE99476FF75FC560245B6097A39AB0BDA76FAB62CA2525B06B69'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.1/PowerShell-6.1.1-win-x64.zip'
    checksum64     = 'F1198F0421A9D0D8CFE10D012AE8EDB625787B341777BF0A2187FF0069EE8661'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
