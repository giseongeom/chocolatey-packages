$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.0/tflint_windows_386.zip'
    checksum       = '607C685D9074C0F36165023643949D2FE70C6CF1C1BA9BB0B22F23938FCB9BEF'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.0/tflint_windows_amd64.zip'
    checksum64     = 'C5BC922FA782DA25F8D9DCFD73753B7467A8936DABA6DAF648A34DD0A4712600'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
