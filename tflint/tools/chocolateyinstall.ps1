$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.7.3/tflint_windows_386.zip'
    checksum       = '27BBBFBC45D3C796DB086AC397B2BAD30E5A0B0C9C244A373C316E6737502812'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.7.3/tflint_windows_amd64.zip'
    checksum64     = 'F9A3B07F47943C8C169371FBF8C6B3707134A8486167B831158A18DD5795D5F3'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
