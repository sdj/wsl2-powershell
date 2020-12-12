. ("$PSScriptRoot/config.ps1")

# from https://github.com/Microsoft/WSL/issues/3974

Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName |
    Where-Object -Property DistributionName -eq "$local_dist_name" |
    Set-ItemProperty -Name DefaultUid -Value 1000
