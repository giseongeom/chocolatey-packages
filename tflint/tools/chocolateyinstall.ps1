$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.17.0/tflint_windows_386.zip'
    checksum       = '5ca5e2ec65531a33594c9e15573387d52072bdc4fdf98ffd97c6776ebe684758'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.17.0/tflint_windows_amd64.zip'
    checksum64     = 'eaea9f5946dae81d173c28388ca529f2b2a2cd1b74281c96d9a21bb2e15ade5e'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
