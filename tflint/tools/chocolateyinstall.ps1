$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.40.1/tflint_windows_386.zip'
    checksum       = '27c2604e10b09c7fd6d928fb45d5ec798acac0c87d573ede83585351c9730656'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.40.1/tflint_windows_amd64.zip'
    checksum64     = 'c1589a6fabcd1d7a3d78107fe7b60c1fd99d25b5d15a547cd3155033aa802632'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
