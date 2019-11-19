$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.1/tflint_windows_386.zip'
    checksum       = 'd7eca9d0843ff02a38e8981c82bf0f8caec560f9878650f4b7407e8da1e588cf'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.1/tflint_windows_amd64.zip'
    checksum64     = '715ff0539130d2a5c4b35f8021fe7204108c8487442a4f28857d9f5bdfee6799'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
