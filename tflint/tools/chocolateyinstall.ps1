$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.39.3/tflint_windows_386.zip'
    checksum       = 'af5333b7f543e4a14842eca9ffb269715baa3260db6b7cf6c6c2e186570a4c42'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.39.3/tflint_windows_amd64.zip'
    checksum64     = '320ecd479679bcc80375353732066e4f918366f939c9c24923f4f0315abce270'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
