$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.20.3/tflint_windows_386.zip'
    checksum       = 'd1e032cf83bdd8d567e2a69e37aa7e33f4dda12b45babbfae26e2cb0d3bbf37a'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.20.3/tflint_windows_amd64.zip'
    checksum64     = 'ca7e1604786cda6d276c1200c364e9c1b379210337a5d387398ebbc162ebe424'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
