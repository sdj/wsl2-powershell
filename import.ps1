. ("$PSScriptRoot/config.ps1")

if ($(Test-Path -Path "$local_dist_name") -eq $true) {
    Write-Output "destination $local_dist_name already exists"
}
mkdir "$local_dist_name" > $null
wsl --import "$local_dist_name" "$local_dist_name" "$ms_wsl_name.tar.gz"
