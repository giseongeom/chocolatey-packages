$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.22.0/tflint_windows_386.zip'
    checksum       = 'b75ef3679255b58fc480c90be8359321df86597ce96931a707cd8036e1dc05cb'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.22.0/tflint_windows_amd64.zip'
    checksum64     = '4c1983fc733b63cab2dd434c45b22fa01f8ad68a0da7c13c0d3b5bf796b7817f'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
