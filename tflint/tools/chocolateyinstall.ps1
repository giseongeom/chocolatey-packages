$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.21.0/tflint_windows_386.zip'
    checksum       = '972efb80214775f268e6968f1df8ac8053899c50d0d8850dedaa1ebee287decf'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.21.0/tflint_windows_amd64.zip'
    checksum64     = '0278ac1becd91d4cb8bf8231be5dafbe33e3828bd8fd7a6724455694b594191d'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
