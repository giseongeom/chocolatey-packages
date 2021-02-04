$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.24.1/tflint_windows_386.zip'
    checksum       = '66395a2ed8459a8feb47e4d87056119260cdb40a5b574ae3e293aa51291fc85f'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.24.1/tflint_windows_amd64.zip'
    checksum64     = 'be9051a6bca5dfc813636c9d645dd4d6125e819ba5ccb236bf48b194192a8da8'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
