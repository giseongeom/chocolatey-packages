$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.34.1/tflint_windows_386.zip'
    checksum       = 'F9DD59F99CE93924F3F411909AB884C4AB56DD91E3DAC246FEA8CA0195EC16FF'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.34.1/tflint_windows_amd64.zip'
    checksum64     = '6EAB6688B9F1B1E0B2B69C9A89B3B82192540C58E8CBFBD66B8CA13519267F8C'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
