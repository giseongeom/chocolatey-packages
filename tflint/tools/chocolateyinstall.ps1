$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.20.2/tflint_windows_386.zip'
    checksum       = 'c99ac288309e379f60188655b7c4c783d93f8b901401e04b467cf6971616e96f'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.20.2/tflint_windows_amd64.zip'
    checksum64     = '7d73ba1005b39091d1e70d16900c3c15f39cc72a359723fcf885da973ee0d04a'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
