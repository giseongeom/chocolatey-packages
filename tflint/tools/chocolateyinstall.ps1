$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.28.1/tflint_windows_386.zip'
    checksum       = '0AF8507F273AD8751160812593844EF82641C47B176E5E7917422A7CC01A4CEB'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.28.1/tflint_windows_amd64.zip'
    checksum64     = '69783B6FA1A4985F169D02970C04D422DD8307F4650E5B6E562D0202F204A4C1'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
