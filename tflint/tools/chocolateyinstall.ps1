$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.26.0/tflint_windows_386.zip'
    checksum       = 'F14EF08579614A18147EE231A0306F63A86F40B53509D897FE774F3A9EA97F14'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.26.0/tflint_windows_amd64.zip'
    checksum64     = '4B9577F5D2395F485663332C16A1605FCE515B58FFE9895E080ADF37E4403D67'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
