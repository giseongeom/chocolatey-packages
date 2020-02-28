$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.15.0/tflint_windows_386.zip'
    checksum       = '8bac8ba3bf20006b49e84a5cacd8b4159df2a8206509f861037afb85f9e2788c'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.15.0/tflint_windows_amd64.zip'
    checksum64     = '5ae48f9e937ea128b3c2c0314dd77d409a2b80630bbe1d4795cf6c4406d5d8ed'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
