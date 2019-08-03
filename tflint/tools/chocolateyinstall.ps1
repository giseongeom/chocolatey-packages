$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.9.3/tflint_windows_386.zip'
    checksum       = '9AE1887E74A856A0FA4CA15DF0E48D8EF7363CB56EF1767467BB3E5BDABC67AB'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.9.3/tflint_windows_amd64.zip'
    checksum64     = 'C963AB5BDD12C6CC7D8FDEE2EF62CBF7494DC8CBE0ECEB71F852CED53C680501'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
