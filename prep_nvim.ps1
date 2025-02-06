# Setup nvim configuration for root user
Function Prep-Neovim {
  $uaData = 'C:\Users\eeccher\Appdata\Local'
  cp -Recurse -Force $uaData\nvim ~\Appdata\Local\
  cp -Recurse -Force $uaData\nvim-data ~\Appdata\Local\
  Write-Host -ForegroundColor 'Green' "Neovim-config loaded"
}

if(!(Test-Path -PathType Container ~\AppData\Local\nvim)) { Prep-Neovim }
