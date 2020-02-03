$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.14.0/tflint_windows_386.zip'
    checksum       = '5ce8464d857c93ec5c0dff17452893c2f3cfc563d48cb927ce5f220eb0d75316'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.14.0/tflint_windows_amd64.zip'
    checksum64     = '81327f1dfb3c4b597c61de40a76f2b744f46c7d12107604d1000257ba414b6ba'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
