$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.3/tflint_windows_386.zip'
    checksum       = 'c89ebc16b178549135d2286febf9fc86cd7ac246a52e22bb60213d157a34b5d8'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.3/tflint_windows_amd64.zip'
    checksum64     = '6c7d90e3d19f88327a93c4da554099686add108f6a8260efd35edfcb72a4b346'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
