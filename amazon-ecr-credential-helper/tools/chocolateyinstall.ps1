$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binFileName = 'docker-credential-ecr-login'
$fileFullPath = Join-Path $toolsDir "$binFileName.exe"

$packageArgs = @{
    packageName  = 'amazon-ecr-credential-helper'
    FileFullPath = $fileFullPath

    # 32-bit
    url          = 'https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.4.0/windows-amd64/docker-credential-ecr-login.exe'
    checksum     = '16e5a0393034be2b69a0130d7d946cd419beb7ad93d80785c57c46181b82bf91'
    checksumType = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
