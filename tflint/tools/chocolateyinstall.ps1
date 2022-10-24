$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.0/tflint_windows_386.zip'
    checksum       = '607c685d9074c0f36165023643949d2fe70c6cf1c1ba9bb0b22f23938fcb9bef'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.0/tflint_windows_amd64.zip'
    checksum64     = 'c5bc922fa782da25f8d9dcfd73753b7467a8936daba6daf648a34dd0a4712600'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
