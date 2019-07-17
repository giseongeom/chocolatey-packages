$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.9.1/tflint_windows_386.zip'
    checksum       = '5abe876e4e1adb579cf375cb74227fc3c113446aad15fcb9c1ea00db5aa4713f'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.9.1/tflint_windows_amd64.zip'
    checksum64     = '5f76554930c1681783152fb4092971af1d0e82db5c070a73ae5d455c0b37c8c0'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
