. ("$PSScriptRoot/config.ps1")

#7z e "$wsldist.appx" -so "install.tar.gz" 2> _stderr.txt > "$wsldist.tar.gz"

## from https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/extract-specific-files-from-zip-archive
#Expand-Archive -Path "$wsldist.appx"

Add-Type -AssemblyName System.IO.Compression.FileSystem

$zip = [System.IO.Compression.ZipFile]::OpenRead("$PWD\$ms_wsl_name.appx")

$zip.Entries |
    Where-Object { $_.FullName -eq "install.tar.gz" } |
    ForEach-Object {
        Write-Output "$ms_wsl_name.appx:$_ => $ms_wsl_name.tar.gz"
        [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_, "$PWD\$ms_wsl_name.tar.gz", $true)
    }

$zip.Dispose()
