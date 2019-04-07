$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.7.5/tflint_windows_386.zip'
    checksum       = '6927B20342FDDD043CE375ACAC0699659EB3C4BC6AAD0C8AC69E6A0D3E451220'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.7.5/tflint_windows_amd64.zip'
    checksum64     = 'DEA24C79567E3AFFC191D215143674A6525FEA402C4A4C2DAB3164D0085133C7'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
