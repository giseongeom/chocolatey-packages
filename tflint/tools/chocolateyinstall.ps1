$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.11.2/tflint_windows_386.zip'
    checksum       = '32d3f2d691983aec6e339c983bce08dbd055848c1ff9d6ea864fea65bbdab07e'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.11.2/tflint_windows_amd64.zip'
    checksum64     = '2e507a7b4307d729f1cab07faa0139786dba3ef22f28967c03a0ad2e3aee1ac7'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
