$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.31.0/tflint_windows_386.zip'
    checksum       = 'A89F51A94874D621B059D63BC9639D3122F1DBF8ABB085E1A99CE0F45DD2E0BF'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.31.0/tflint_windows_amd64.zip'
    checksum64     = 'DB6434C2B6B99A8795CB51E1A4F412592CDC0DA86C287503C920427F2D085E69'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
