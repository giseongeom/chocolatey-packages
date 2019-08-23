$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.10.1/tflint_windows_386.zip'
    checksum       = '8916d44ab19e9455f49b0ae5af295370c8688c36d39edd421311938754bca307'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.10.1/tflint_windows_amd64.zip'
    checksum64     = '92e53629ba18c32714b1c0e1a283b045ad0c010854c8d785b6ae7c92bdbc3cda'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
