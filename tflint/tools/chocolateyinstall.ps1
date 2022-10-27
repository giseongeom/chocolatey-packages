$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.2/tflint_windows_386.zip'
    checksum       = '5F8F173950A8E3D6D64EB16C020B5ACEDA4A135E34F76FA981D663E0D0E3A3EC'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.2/tflint_windows_amd64.zip'
    checksum64     = '5A79187D59D6CC508E532CFE95FC934AF01FF034A4A74BE0BCE6727536E17F9B'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
