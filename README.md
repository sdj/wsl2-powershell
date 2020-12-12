# WSL2 offline tools

# Usage

- Run the scripts from a directory where you want to store WSL distributions
- Edit `config.ps1` values as desired
- Run the following:

```powershell
WSL2/download.ps1
WSL2/extract.ps1
WSL2/import.ps1
wsl -d DISTNAME
adduser USERNAME
usermod -a -G sudo USERNAME
exit
WSL2/setdefaultuser.ps1
wsl -d DISTNAME
```

## TODO

- Automatically setdefaultuser on import
- Change config.ps1 variables to be sensible tool data, not user config
- Change config values to commandline args
- Auto-provision user account:

```powershell
# check for uid 1000 in wsl dist
wsl -d DISTNAME id 1000

# check whether first user account exists and  prompt user to run setupuser.ps1 or something
echo $?

```


## References

Windows Server Installation Guide
https://docs.microsoft.com/en-us/windows/wsl/install-on-server

Windows Subsystem for Linux Installation Guide for Windows 10
https://docs.microsoft.com/en-us/windows/wsl/install-win10

