$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$binFileName = 'docker-credential-ecr-login'
$fileFullPath = Join-Path $toolsDir "$binFileName.exe"

$packageArgs = @{
    packageName  = 'amazon-ecr-credential-helper'
    FileFullPath = $fileFullPath

    # 64-bit
    url64          = 'https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.6.0/windows-amd64/docker-credential-ecr-login.exe'
    checksum64     = '3356E38A20566D688AC6ED22A9999ECCA4559ED56EEC4D402430B581CAE84BB9'
    checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
