function directory{
  (pwd).path
}

function error-block{
  if($?) {
    "`e[32m]|[`e[0m"
  } else {
    if ($LastExitCode -eq 0) {
      # PowerShell returns 0 for 'Command not found' we want 127 because 0 means success
      "`e[41m127`e[0m"
    } else {
      # If it was a different error, return that code instead
      "`e[41m$LastExitCode`e[0m"
    }
  }
}

function hostname{
  $env:computername.toLower()
}

function spec-prompt{
  "Directory: $(directory)"
  "ErrorBlock: $(error-block)"
  "Hostname: $(hostname)"
}

function Global:prompt { "$env:username$(error-block)$(hostname):$(directory)`r`n󰨡 " }
