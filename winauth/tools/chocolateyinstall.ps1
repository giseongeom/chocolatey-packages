$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName     = 'winauth'
    # 32-bit
    FileFullPath    = "$toolsDir\winauth.zip"
    # 64-bit
    FileFullPath64  = $FileFullPath
    # misc
    Destination     = $toolsDir
}

Get-ChocolateyUnzip @packageArgs
