$ErrorActionPreference = 'Stop'; # stop on all errors
# 32-bit
$url = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.0-preview.4/PowerShell-6.1.0-preview.4-win-x86.zip'
$checksum = '528CB75A9186C6CD31C52A8B2B0498F3CDD330ECC673F56DB9B6680B6969E7A6'
$checksumType = 'sha256'

# 64-bit
$url64 = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.0-preview.4/PowerShell-6.1.0-preview.4-win-x64.zip'
$checksum64 = 'E9B0A0AB7034C157123C01F8F780B0BCD0748DEC39AE115E12781EA175A557BA'
$checksumType64 = $checksumType

$packageName = 'powershell.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -url $url -url64bit $url64 `
  -checksum $checksum -checksumType $checksumType `
  -checksum64 $checksum64 -checksumType64 $checksumType64 `
  -unziplocation "$toolsDir\pwsh"

