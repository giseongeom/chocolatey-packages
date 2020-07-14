$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binFileName = 'docker-credential-ecr-login'
$fileFullPath = Join-Path $toolsDir "$binFileName.exe"

$packageArgs = @{
    packageName    = 'amazon-ecr-credential-helper'
    FileFullPath   = $fileFullPath

    # 64-bit
    url64bit       = 'https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.4.0/windows-amd64/docker-credential-ecr-login.exe'
    checksum64     = '16e5a0393034be2b69a0130d7d946cd419beb7ad93d80785c57c46181b82bf91'
    checksumType64 = 'sha256'

    # 32-bit
    url            = $url64bit
    checksum       = $checksum64
    checksumType   = $checksumType64
}

Get-ChocolateyWebFile @packageArgs
