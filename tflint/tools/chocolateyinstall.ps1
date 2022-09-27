$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.41.0/tflint_windows_386.zip'
    checksum       = '8120278f675d4e931cd8ab5be0f1394d74640715d9ce9303b9a9de5bfc5d3f1d'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.41.0/tflint_windows_amd64.zip'
    checksum64     = '02981ed841be4fb05764f2ef8f9d520e01ea5b0d54780191dc410d4c468750e2'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
