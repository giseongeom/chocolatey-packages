$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.29.1/tflint_windows_386.zip'
    checksum       = 'CC7BCD38F4232DCA5D102F4D2EB02A94760C0C813EF1A8DFC0257D7C28ED3AF9'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.29.1/tflint_windows_amd64.zip'
    checksum64     = '78CC691BF7010400D93F7C9CF44110448230225099650BC0E6F2139D59BADD6C'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
