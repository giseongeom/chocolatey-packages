

# borrowed from https://chocolatey.org/packages/hackfont

# The list of fonts to uninstall is based on the content normal zip installation.
# It's possible, although unlikely, that these might change, however there are exceptionally low odds
# That any other font would use these names
# Note that font uninstallation requires both removal of files AND registry keys.
#   This might not be universally happy, (Future OSes etc...) but it works on Win7 and 10

$filenames = @('NanumGothicCoding.ttf', 'NanumGothicCoding-Bold.ttf')

# Obtain system font folder for removal root
$shell = New-Object -ComObject Shell.Application
$fontsFolderObj = $shell.Namespace(0x14)
$fontsFolder = $fontsFolderObj.Self.Path

# Segment from: http://powershell.com/cs/media/p/16150.aspx
    # created by Dr. Tobias Weltner, MVP PowerShell
    # please keep this notice
    # use code freely at your own risk
    # looking for quality PowerShell trainings?
    # drop me a line: tobias.weltner@scriptinternals.de

function Remove-FontFromRegistry($FileName) {
    $Path = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts'
    $key = Get-Item $Path
    $props = @($key.GetValueNames() |
        Where-Object { $key.GetValue($_) -eq $FileName })
    If ($props.count -gt 0) {
        Remove-ItemProperty -Path $Path -Name $props
        Write-Warning ('Removed these registry values: {0}' -f ($props -join ', '))
    } Else {
        Write-Warning ('Did not find registry values for: {0}' -f ($FileName))
    }
}

# End segment

# Get all the fonts that match the general filename format
Get-ChildItem $fontsFolder -Filter NanumGothicCoding*.ttf |
    ForEach-Object {
        # If any of them are exact matches of what we originally installed
        If ($filenames -contains $_) {
            $filepath = Join-Path $fontsFolder $_
            Write-Warning "Deleted $filepath"
            Remove-Item $filepath
            Remove-FontFromRegistry($_)
        }
    }