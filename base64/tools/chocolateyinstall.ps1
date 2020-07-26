$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binFileName = 'base64'
$fileFullPath = Join-Path $toolsDir "$binFileName.exe"

$packageArgs = @{
    packageName  = 'base64'
    FileFullPath = $fileFullPath

    # 32-bit
    url          = 'http://www.rtner.de/software/base64.exe'
    checksum     = 'a0aba89ebeb995cedff714829cb08cfafc1f8481292702bfa30fc9c5a7bce88f'
    checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
