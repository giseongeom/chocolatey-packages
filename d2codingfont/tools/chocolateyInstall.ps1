
# borrowed from https://chocolatey.org/packages/FiraCode
function Get-CurrentDirectory
{
  $thisName = $MyInvocation.MyCommand.Name
  [IO.Path]::GetDirectoryName((Get-Content function:$thisName).File)
}

$fontHelpersPath = (Join-Path (Get-CurrentDirectory) 'FontHelpers.ps1')
. $fontHelpersPath

$fontUrl = 'https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip'
$checksumType = 'sha256';
$checksum = '0F1C9192EAC7D56329DDDC620F9F1666B707E9C8ED38FE1F988D0AE3E30B24E6'

$destination = Join-Path $Env:Temp 'd2codingfont'

Install-ChocolateyZipPackage -PackageName 'd2codingfont' -url $fontUrl -unzipLocation $destination -ChecksumType "$checksumType" -Checksum "$checksum"

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
