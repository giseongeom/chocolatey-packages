$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binFileName = 'docker-credential-ecr-login'
$fileFullPath = Join-Path $toolsDir "$binFileName.exe"

$packageArgs = @{
    packageName  = 'amazon-ecr-credential-helper'
    FileFullPath = $fileFullPath

    # 64-bit
    url64          = 'https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.7.0/windows-amd64/docker-credential-ecr-login.exe'
    checksum64     = '634e35d502f42a279117c99fd7562d3c17d304ce8a01ea11e4e2353d5a17b080'
    checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
