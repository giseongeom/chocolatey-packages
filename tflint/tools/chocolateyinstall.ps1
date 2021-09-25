$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.32.1/tflint_windows_386.zip'
    checksum       = '998C5C10FAACADB1D5C2EF5DF4975707634838289DF3625BA412ED58FED734A6'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.32.1/tflint_windows_amd64.zip'
    checksum64     = '00E2477AA580DF7FDF6BE53E75BC05AA595A99F2371D0AC05C7E242FE2C6A1B6'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
