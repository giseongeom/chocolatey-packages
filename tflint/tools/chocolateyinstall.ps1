$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.25.0/tflint_windows_386.zip'
    checksum       = 'ba6e65bcf8dbe8739400e6bc38e5171c6ebff39010de5358dcfedd66f3e6f051'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.25.0/tflint_windows_amd64.zip'
    checksum64     = 'c9e25831759e94308e141a5520406d3a683c3504adf49a6e25b2828a18a4407c'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
