$ErrorActionPreference = 'Stop'; # stop on all errors
# 32-bit
$url = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.0-preview.2/PowerShell-6.1.0-preview.2-win-x86.zip'
$checksum = '2172237F4146C4B3BA0BFBDD1B3CDAC71FA8D3C2008FA3C35465186FBDD9802C'
$checksumType = 'sha256'

# 64-bit
$url64 = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.0-preview.2/PowerShell-6.1.0-preview.2-win-x64.zip'
$checksum64 = '1D86504C3241EB65771B3D96547C054AD8852AD06506AE47C82483ED72C20941'
$checksumType64 = $checksumType

$packageName = 'powershell.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -url $url -url64bit $url64 `
  -checksum $checksum -checksumType $checksumType `
  -checksum64 $checksum64 -checksumType64 $checksumType64 `
  -unziplocation "$toolsDir\pwsh"

