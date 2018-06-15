$ErrorActionPreference = 'Stop'; # stop on all errors
# 32-bit
$url = 'https://github.com/sgreben/jp/releases/download/1.1.11/jp_1.1.11_windows_x86_32.zip'
$checksum = '26B9E6EF9CF81994BDCDAA8AAB50956F20E85A8D3C067A04C61BEF500C4B42E5'
$checksumType = 'sha256'

# 64-bit
$url64 = 'https://github.com/sgreben/jp/releases/download/1.1.11/jp_1.1.11_windows_x86_64.zip'
$checksum64 = 'B1F301778C78D7DFFDAF534528EBEC014037660B544B6FBA58308D764D73DA92'
$checksumType64 = $checksumType

$packageName = 'jp'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -url $url -url64bit $url64 `
  -checksum $checksum -checksumType $checksumType `
  -checksum64 $checksum64 -checksumType64 $checksumType64 `
  -unziplocation "$toolsDir"

