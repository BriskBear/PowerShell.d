Function Restart-Shell {
  clear
  . $env:profile
}

Set-Alias rs 'Restart-Shell'
