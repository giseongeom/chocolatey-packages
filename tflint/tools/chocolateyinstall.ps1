$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.9.0/tflint_windows_386.zip'
    checksum       = 'b8ef056249456fbe2914958241016836ee5199d7e9b48995671a3964f6442b90'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.9.0/tflint_windows_amd64.zip'
    checksum64     = '8f608206d5030c0e86735f2efac00f99f51a661ea2c8904ac0f27d7071a6d3c4'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
