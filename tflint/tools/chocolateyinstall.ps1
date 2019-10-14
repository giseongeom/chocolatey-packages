$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.12.1/tflint_windows_386.zip'
    checksum       = '8833abd26be1e81d01547678e0fe6d5bd69f99cea9f6c5942641f9d65f94ca55'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.12.1/tflint_windows_amd64.zip'
    checksum64     = '26a6a7ba5fa5c6183a76ffb141ad5d9e95e4a962bb68703c8918e7e50b1667ed'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
