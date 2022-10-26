$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.1/tflint_windows_386.zip'
    checksum       = '3E8EA0DFD38C33F6A9B42EB67979DB99F81FD9132D293291A3F08A240BC43634'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.42.1/tflint_windows_amd64.zip'
    checksum64     = 'EB47BEBF629C9C10573E17643F34C814341A4D4C7DBBBF837DCE1DE254CBB3A8'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
