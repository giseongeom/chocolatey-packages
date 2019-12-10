$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.2/tflint_windows_386.zip'
    checksum       = 'bc53d78d47888e5b44b91a20e8c805da33996a7a69bddcc222c62e3706c4c316'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.2/tflint_windows_amd64.zip'
    checksum64     = 'a5b370cd58f2e00391e1627fa9b95f8bee911b79dfdebf062d8e1bb34f3357cc'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
