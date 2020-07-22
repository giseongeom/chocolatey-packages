$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.18.0/tflint_windows_386.zip'
    checksum       = '745badad99705fcbc9a45a1c8493b38d41dd392778f23b14f820c9c85e156f86'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.18.0/tflint_windows_amd64.zip'
    checksum64     = '3a68b330da6a995c5c3779443d3eab9662e705070593cc5388c87996a04faa7d'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
