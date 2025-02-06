function Shortcut-Invoke($ComputerName, $Block, $FilePath) {
  . $PSScriptRoot\get_fqdn.ps1

  $command = [scriptblock]::create("$Block")
  if ($FilePath) {
    Invoke-Command -ComputerName $( Get-FQDN ComputerName ).fqdn -FilePath $FilePath
  } else {
    Invoke-Command -ComputerName $( Get-FQDN $ComputerName ).fqdn -ScriptBlock $command
  }
}

Set-Alias invoke 'Shortcut-Invoke'
