$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.11.0/tflint_windows_386.zip'
    checksum       = '364d98f0f5630f53b7ae8163b3579c3410b48ae9ade48eb01d26c264072eb2a5'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.11.0/tflint_windows_amd64.zip'
    checksum64     = 'a32de8305d32312a3b289e606a8641946d5508a07b768e1627b4c978f1e9e906'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
