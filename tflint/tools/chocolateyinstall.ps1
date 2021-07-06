$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.30.0/tflint_windows_386.zip'
    checksum       = '6BC97705938CFB2DDE9FC2C3DD2A58709FE3F410F7C55FA5E513D1C2F84AF18F'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.30.0/tflint_windows_amd64.zip'
    checksum64     = 'A086C6FF64999F136550594ACA37BCA7D20FF1EE98E3D30FE55B5D72225410AA'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
