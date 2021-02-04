$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.24.0/tflint_windows_386.zip'
    checksum       = 'c9d1168ae8f940b0ec090b1a653c0141f75057bb6cfde78eb81345bdd2cdfd81'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.24.0/tflint_windows_amd64.zip'
    checksum64     = 'b5512f2b823f5292af3397282446000934578dd6eded88ead1655cd6a16de901'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
