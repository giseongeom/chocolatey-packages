
# borrowed from https://chocolatey.org/packages/FiraCode
function Get-CurrentDirectory
{
  $thisName = $MyInvocation.MyCommand.Name
  [IO.Path]::GetDirectoryName((Get-Content function:$thisName).File)
}

$fontHelpersPath = (Join-Path (Get-CurrentDirectory) 'FontHelpers.ps1')
. $fontHelpersPath

$fontUrl = 'https://github.com/naver/nanumfont/releases/download/VER2.5/NanumGothicCoding-2.5.zip'
$checksumType = 'sha256';
$checksum = 'F4C9B1082CB36D793CCF75A331316C880EF9E4BC229408C22F9D2703B7619A3F';

$destination = Join-Path $Env:Temp 'NanumGothicCodingFont'

Install-ChocolateyZipPackage -PackageName 'NanumGothicCodingFont' -url $fontUrl -unzipLocation $destination -ChecksumType "$checksumType" -Checksum "$checksum"

$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)

$fontFiles = Get-ChildItem $destination -Recurse -Filter *.ttf | Where-Object { $_.Length -gt 1024 }

# unfortunately the font install process totally ignores shell flags :(
# http://social.technet.microsoft.com/Forums/en-IE/winserverpowershell/thread/fcc98ba5-6ce4-466b-a927-bb2cc3851b59
# so resort to a nasty hack of compiling some C#, and running as admin instead of just using CopyHere(file, options)
$commands = $fontFiles |
ForEach-Object { Join-Path $fontsFolder.Self.Path $_.Name } |
Where-Object { Test-Path $_ } |
ForEach-Object { "Remove-SingleFont '$_' -Force;" }

# http://blogs.technet.com/b/deploymentguys/archive/2010/12/04/adding-and-removing-fonts-with-windows-powershell.aspx
$fontFiles |
ForEach-Object { $commands += "Add-SingleFont '$($_.FullName)';" }

$toExecute = ". $fontHelpersPath;" + ($commands -join ';')
Start-ChocolateyProcessAsAdmin $toExecute

Remove-Item $destination -Recurse
