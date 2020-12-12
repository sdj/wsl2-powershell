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
wsl.exe -d DISTNAME sh -c "id 1000"

# check whether first user account exists and  prompt user to run setupuser.ps1 or something
Write-Output $?

```

 - `wsl.exe --import` doesn't set the default user to 1000 so the auto user provisioning should check if uid=1000 exists already and set it automatically, otherwise give user a way to create & provision a new user from scratch and set it as default automatically

- Add export helper for compression e.g., `wsl --export dist - | 7z a -si dist.tar.xz`
- Add import helper for compression e.g., `7z x -so dist.tar.xz | wsl --import -`
- User provisioning should not require uid=1000, should be user-definable, declaractive (i.e., if setupuser.ps1 "username" username does not exist, create it and get that uid to set the wsl default user)

- Test existence of distribution, to use as guard in other contexts. Would allow --force to automatically remove/recreate a distribution.

```powershell
wsl -d asdf true > $null
There is no distribution with the supplied name.
echo $?
False
wsl -d ub2004 true
echo $?
True
```

## References

Windows Server Installation Guide
https://docs.microsoft.com/en-us/windows/wsl/install-on-server

Windows Subsystem for Linux Installation Guide for Windows 10
https://docs.microsoft.com/en-us/windows/wsl/install-win10

