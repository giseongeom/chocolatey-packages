$ErrorActionPreference = 'Stop'; # stop on all errors
# 32-bit
$url = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.0-preview.3/PowerShell-6.1.0-preview.3-win-x86.zip'
$checksum = 'A95C6BA5698ED1530A27A26AB1E24B76F88CBE05FF06C8F493903A23A0B56919'
$checksumType = 'sha256'

# 64-bit
$url64 = 'https://github.com/PowerShell/PowerShell/releases/download/v6.1.0-preview.3/PowerShell-6.1.0-preview.3-win-x64.zip'
$checksum64 = '55C849547A03F19E8275BED5221FADB54F97759D6F540243A935D8477EE2C159'
$checksumType64 = $checksumType

$packageName = 'powershell.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -url $url -url64bit $url64 `
  -checksum $checksum -checksumType $checksumType `
  -checksum64 $checksum64 -checksumType64 $checksumType64 `
  -unziplocation "$toolsDir\pwsh"

