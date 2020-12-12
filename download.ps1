. ("$PSScriptRoot/config.ps1")

Invoke-WebRequest -Uri "https://aka.ms/$ms_wsl_name" -OutFile "$ms_wsl_name.appx" -UseBasicParsing
