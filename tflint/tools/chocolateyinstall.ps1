$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'tflint'

    # 32-bit
    url            = 'https://github.com/wata727/tflint/releases/download/v0.12.0/tflint_windows_386.zip'
    checksum       = '239861c4f3c3b9d16af6672cefce7bef66bc6892f147fb5dcd7063c5c955909d'
    checksumType   = 'sha256'

    # 64-bit
    url64bit       = 'https://github.com/wata727/tflint/releases/download/v0.12.0/tflint_windows_amd64.zip'
    checksum64     = 'acd100d538cffdd6d46cb4c429b1fbcd9ea41ee32821f8b0250bc7418621ba56'
    checksumType64 = $checksumType

    # misc
    unziplocation  = "$toolsDir"
}

Install-ChocolateyZipPackage @packageArgs
