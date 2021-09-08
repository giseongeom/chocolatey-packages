$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binFileName = 'docker-credential-ecr-login'
$fileFullPath = Join-Path $toolsDir "$binFileName.exe"

$packageArgs = @{
    packageName  = 'amazon-ecr-credential-helper'
    FileFullPath = $fileFullPath

    # 64-bit
    url64          = 'https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.5.0/windows-amd64/docker-credential-ecr-login.exe'
    checksum64     = '183563fddfed2c1f4d09a1929f3b9e3a1dea58ec1f6ba4db5db9b970c0be06b7'
    checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
