$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.40.0/tflint_windows_386.zip'
    checksum       = '65790dd6d2e2458a4a7a5a5590a14d08383c1877273fc4c185e6df315de3f4bc'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.40.0/tflint_windows_amd64.zip'
    checksum64     = '826ad8df89c8c996e693d9bab2e616416fcb2cec0510d4befe0fc195b31ece53'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
