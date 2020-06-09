$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.16.2/tflint_windows_386.zip'
    checksum       = 'bacf870b68c2a336ca404e637758addc4e2f38a2ee93c8e94f29124e4a405d3d'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.16.2/tflint_windows_amd64.zip'
    checksum64     = '5cf61c96523c826d1e9bd470eb4215a0a2e876885450fcafdfcaf95ca41fedfd'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
