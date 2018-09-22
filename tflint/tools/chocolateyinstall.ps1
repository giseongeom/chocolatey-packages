$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.7.2/tflint_windows_386.zip'
    checksum       = '7EDDEF61EFFD637E69D6C072A219E42ABC79C0942E1208568521CB342FB1DDB2'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.7.2/tflint_windows_amd64.zip'
    checksum64     = '721C4193FE7CB8A7D0EDFDFADDFA1037A6ECA4B62E296F631B54B38A2BFC9BD8'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
