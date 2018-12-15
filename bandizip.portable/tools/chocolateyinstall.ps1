$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = 'bandizip.portable'
    # 32-bit
    url            = 'https://en.bandisoft.com/bandizip/dl.php?portable'
    checksum       = '8876351CD2D6DD5B8531D8E4736305A3F98AE16A30F230F5F5DD92E16E69C9F9'
    checksumType   = 'sha256'
    # 64-bit
    url64bit       = 'https://en.bandisoft.com/bandizip/dl.php?portable64'
    checksum64     = 'F24B48777E803CDEF7ED8E2D084ACA8692881F3D1DD0228D7EBC44F6ECD6A838'
    checksumType64 = $checksumType
    # misc
    unziplocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
