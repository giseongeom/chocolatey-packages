$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.19.0/tflint_windows_386.zip'
    checksum       = 'a266c6f2cfc2103eb423d66592c649d1a387bad4712bc72c65298f31f91e3475'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.19.0/tflint_windows_amd64.zip'
    checksum64     = 'f03d54b0f77614230586000ebd0d8b2206d39fc999aec9cc6310b23204b33078'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
