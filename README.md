# PowerShell.d  
_PowerShell handy auto-load shortcuts_  

---  

## Install:  
`if (!(Test-Path -PathType container ~\.config)) { mkdir ~\.config }`  
`git clone https://github.com/briskbear/PowerShell.d ~\.config\PowerShell.d`  
`. ~\.config\PowerShell.d\create_link.ps1`  
`ln ~\.config\PowerShell.d\config.yml ~\.config\config.yml`  
`if (!(Test-Path -PathType container ~\Documents\WindowsPowerShell)) { mkdir ~\Documents\WindowsPowerShell }`  
`if (!(Test-Path -PathType leaf ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1)) {cp ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1.bak}`  
`ln ~\.config\PowerShell.d\.profile ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`  
