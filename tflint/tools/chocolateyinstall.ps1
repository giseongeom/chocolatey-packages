$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.23.0/tflint_windows_386.zip'
    checksum       = '911f5d5365af93385f5459afe230b47a6cc921ad42a73aed0db446cbd4839ecb'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.23.0/tflint_windows_amd64.zip'
    checksum64     = '4df0e195a1418646394c491ada14a0c6e2c8092796926f97d9f49f1e1592a55d'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
