# Powershell Profile

. $env:UserProfile\.config\PowerShell.d\environment.ps1  # Load $config from ~\.config\config.yml

# Source *.ps1 files in ~\Code\profile.d
foreach ($p in $(Get-ChildItem $($config.Profile)*.ps1).FullName) { . $p }

'Profile loaded'
