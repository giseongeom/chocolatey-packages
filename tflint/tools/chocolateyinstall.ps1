$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.10.0/tflint_windows_386.zip'
    checksum       = 'cfebd9f96f28da616efed36adb5b52b78afb2c597430fc530cc655f348eb4f35'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.10.0/tflint_windows_amd64.zip'
    checksum64     = '71ac23ffb969f1e49243d85efbfdde34af2885d74111992bf08e716814cca8c8'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
