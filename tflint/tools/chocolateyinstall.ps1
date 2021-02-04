$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.23.1/tflint_windows_386.zip'
    checksum       = 'b83ae5a0b1dd53db6aa4fa541b0376266743c1ba96fa42f2f992f77675954072'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.23.1/tflint_windows_amd64.zip'
    checksum64     = 'c7fffa0ff8a1c2edc074997847cd96d19644eb23715c92b9134be7ef60148eaa'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
