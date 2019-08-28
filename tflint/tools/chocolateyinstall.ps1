$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.10.3/tflint_windows_386.zip'
    checksum       = '9895D85CC39986F0E0A5FCABFED08F3B1A2223A3BC1231057639480511E62ACF'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.10.3/tflint_windows_amd64.zip'
    checksum64     = 'B9DDDC2274AB7FAECC65D2801A1988EB5B4EF92EF04E611B274DBC67D69332DE'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
