$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.45.0/tflint_windows_386.zip'
    checksum       = '847B252B5AA8D52B1F2B018D19E8FB829028815F1B3EBD1B68E80789E4BEFFF6'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.45.0/tflint_windows_amd64.zip'
    checksum64     = 'B9332372D40F47AD19F5B3557FEDEBC02CDC368E8B390A7810F359D97E03EC42'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
