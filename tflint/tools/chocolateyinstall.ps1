$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.19.1/tflint_windows_386.zip'
    checksum       = '0f802087c9a264f445d6096382c5741afbd09a632b7d3fb4f5dda4c8220ddd6a'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.19.1/tflint_windows_amd64.zip'
    checksum64     = 'fe716ccc2b8d46311f97bd800a15ad69a046e0ad1afdabd3b51b1b2455b32c2d'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
