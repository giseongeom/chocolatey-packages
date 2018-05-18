$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# 32-bit
$url = 'https://download.elifulkerson.com/files/tcping/0.39/tcping.exe'
$checksum = '9F04C46E0CDAA5BCE32D98065E1E510A5F174E51B399D6408F2446444CCCD5FF'
$checksumType = 'sha256'

# 64-bit
$url64 = 'https://download.elifulkerson.com/files/tcping/0.39/x64/tcping64.exe'
$checksum64 = 'AF3C12DA527E88C9DB3774F5F12BAECC2D211C801AE4421C7B16E80F6440ED35'
$checksumType64 = $checksumType

$packageName = 'tcping'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$fileFullPath = Join-Path $scriptPath "$packageName.exe"
Get-ChocolateyWebFile $packageName $fileFullPath $url $url64 `
  -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64 
