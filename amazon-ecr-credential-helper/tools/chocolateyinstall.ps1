$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binFileName = 'docker-credential-ecr-login'
$fileFullPath = Join-Path $toolsDir "$binFileName.exe"

$packageArgs = @{
    packageName  = 'amazon-ecr-credential-helper'
    FileFullPath = $fileFullPath

    # 64-bit
    url64          = 'https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.8.0/windows-amd64/docker-credential-ecr-login.exe'
    checksum64     = 'eb385f5c69dd62087a9c59cbade8feeb47bd9c8ec2addb84b4427dda8d704201'
    checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
