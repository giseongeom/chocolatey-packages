$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/terraform-linters/tflint/releases/download/v0.27.0/tflint_windows_386.zip'
    checksum       = 'D1A9C97CBF50527AC0A838DA9F7F9CEB821616CACE1647BD9F405B540E72C307'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/terraform-linters/tflint/releases/download/v0.27.0/tflint_windows_amd64.zip'
    checksum64     = '7615D80A8C93DE3C977FED429FDBDAB9DAB231E67F5BB6B7ABC6FD59677C33A8'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
