$ErrorActionPreference = 'Stop'; # stop on all errors
# 32-bit
$url = 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/PowerShell-6.0.2-win-x86.zip'
$checksum = '87048B0A2DBD56AA8FE1F92DDB7D7BBF8E904F8D54EE2A62443C7B31AE9E55F8'
$checksumType = 'sha256'

# 64-bit
$url64 = 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.2/PowerShell-6.0.2-win-x64.zip'
$checksum64 = '8CB153E540ED9D9A7FE00CB3D1FE94A0ED089B574FD02E816AB2BB066F4C4F89'
$checksumType64 = $checksumType

$packageName = 'powershell.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -url $url -url64bit $url64 `
  -checksum $checksum -checksumType $checksumType `
  -checksum64 $checksum64 -checksumType64 $checksumType64 `
  -unziplocation "$toolsDir\pwsh"

