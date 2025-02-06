<#

.SYNOPSIS
Enable PowerShell remoting on the named Machine.

.DESCRIPTION
Takes user-input [string] to query dns for the FQDN of a networked machine.
Converts the User input to a usable address and invokes PSexec to enable
PowerShell remoting.

This CMDlet is to be used in conjunction with Invoke.ps1 or Session.p

.EXAMPLE
Enable-Remoting -ComputerName kott

.NOTES
7h15 15 h4ck3j

.LINK
http://cppwind.com

#>
Function Enable-Remoting {
  param(    
      [Parameter(
          Mandatory
      )]$ComputerName
  ) # === You must include the name/IP of the target computer. This name must be in DNS.
  . $PSScriptRoot\get_fqdn.ps1
  $ErrorActionPreference = "Stop"
  
  $MachineName = (Get-FQDN -ComputerName $ComputerName).fqdn
  
  try{
      psExec "\\$MachineName" "PowerShell.exe" 'Enable-PSremoting'
    # PsExec.exe $MachineName # C:\Windows\System32\WindowsPowerShell\v1.0powershell.exe "Enable-PSremoting"
  }catch{
      Write-Log `
       -Out_File D:\Logs\Remoting.log `
       -ForeGround Red `
       -BackGround Black `
       "$_.exception"
  }
}
