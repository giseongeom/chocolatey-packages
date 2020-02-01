$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.4/tflint_windows_386.zip'
    checksum       = '25b006a134f84bcbdcf82d76bcbc11de82d28fa16b05e6d61b9e10ee71d50be2'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.13.4/tflint_windows_amd64.zip'
    checksum64     = '26b8aa52a1da5452ee400d324c6ac2d9f6c3f7bf7bf57172dc802ab0820f567a'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
