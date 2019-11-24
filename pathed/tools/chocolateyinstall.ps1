$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName     = 'pathed'
    # 32-bit
    FileFullPath    = "$toolsDir\pathed.zip"
    # 64-bit
    FileFullPath64  = $FileFullPath
    # misc
    Destination     = $toolsDir
}

Get-ChocolateyUnzip @packageArgs
