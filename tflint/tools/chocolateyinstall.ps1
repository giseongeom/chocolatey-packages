$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.8.0/tflint_windows_386.zip'
    checksum       = '04f2cbd2ab5e571fbe048bf2c11d0dca06a1f85413083d5cba22c0a96581344e'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.8.0/tflint_windows_amd64.zip'
    checksum64     = '5e3d387ebbac4540341750f3430690cad90ab6482a15de1d81cc7f6721dc99f2'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
