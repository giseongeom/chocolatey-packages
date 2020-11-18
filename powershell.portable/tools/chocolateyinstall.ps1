﻿$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'powershell.portable'
    # 32-bit
    url            = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.0/PowerShell-7.1.0-win-x86.zip'
    checksum       = '3d0f768573317a0f69dab4f924b772ee947828d89cbf6bf5c7242b45a3800fbc'
    checksumtype   = 'sha256'
    # 64-bit
    url64bit       = 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.0/PowerShell-7.1.0-win-x64.zip'
    checksum64     = 'c86f260f92b31d4e8e30b1ebbeb09e13364fc095ecf1538d9a8cec18d21d5d32'
    checksumType64 = $checksumType
    # misc
    unziplocation  = "$toolsDir\pwsh"
}

Install-ChocolateyZipPackage @packageArgs
