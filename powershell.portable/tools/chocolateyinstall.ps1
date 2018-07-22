$ErrorActionPreference = 'Stop'; # stop on all errors
# 32-bit
$url = 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.3/PowerShell-6.0.3-win-x86.zip'
$checksum = '51A3FB4AF86C72E300B3C9AAD93BE1665CE67E1077CF109B72CC57F4F8AC539C'
$checksumType = 'sha256'

# 64-bit
$url64 = 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.3/PowerShell-6.0.3-win-x64.zip'
$checksum64 = 'DFFBB84E3E474E00100F6E51F36F7CC1146C70E68CAB72F94AA91AB35CB24AC7'
$checksumType64 = $checksumType

$packageName = 'powershell.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -url $url -url64bit $url64 `
  -checksum $checksum -checksumType $checksumType `
  -checksum64 $checksum64 -checksumType64 $checksumType64 `
  -unziplocation "$toolsDir\pwsh"

