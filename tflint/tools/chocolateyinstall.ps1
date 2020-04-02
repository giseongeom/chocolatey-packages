$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.15.3/tflint_windows_386.zip'
    checksum       = '2d6a6ab81d0a2430cb49b9ea737e0ab07957e4009fd251a2fa8cb1e63ed8c2db'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.15.3/tflint_windows_amd64.zip'
    checksum64     = 'cb44c031093c4347348cef562430c724dea21db6df8db2e4519a71fa0821d012'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
