$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.35.0/tflint_windows_386.zip'
    checksum       = '514F33C9A41424EB05C4194128ADB7DF1096BCE585AD8E92BE7922D92A79AC60'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.35.0/tflint_windows_amd64.zip'
    checksum64     = 'A272599F24E39F6F66E2D4C41DCF7303154BAF7E518FCF1ADD1236A4F4CF9FEA'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
