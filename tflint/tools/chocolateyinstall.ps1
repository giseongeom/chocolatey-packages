$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.7.6/tflint_windows_386.zip'
    checksum       = '86772916467eb294e825c24593ba989639acbb326cc68a6ec9c4cbfbb0bc1127'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.7.6/tflint_windows_amd64.zip'
    checksum64     = '83d1798f63d85f49c9db03192bff9161a67209a6e37309fc978d05a0a70e15b9'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
