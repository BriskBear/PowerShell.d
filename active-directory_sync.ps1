<#

.SYNOPSIS
This is a simple Powershell script to Push an ActiveDirectory Sync from the named Domain Controller.

.DESCRIPTION
New user not showing up on a DC? 
Updated user property not showing up in O365?
User successfully changed password but network still seems locked out?

You might need to synchronize Active Directory! 
This should be used on the Local-Primary DC.

.EXAMPLE
 PS> adsync mp-dc1 d
 Performing Sync: Delta
Tuesday, September 15, 2020 12:24:18 PM

.NOTES
Put some notes here.

.LINK
http://cppwind.com
https://github.com/CPPwind/PowerShell

#>
Function Sync-ActiveDirectory {
  param(
      [Parameter(Mandatory)]${Domain Controller},
      [Parameter(mandatory)]${Select Sync Type (i/d)}
  )
  if(
      ${Select Sync Type (i/d)} -eq 'i'
  ){
      invoke-command ${Domain Controller}{
          import-module ADSync
          Start-adsyncsynccycle `
           -policytype Initial
          echo 'Performing Sync: Initial'
          }
  }
  else{
      invoke-command ${Domain Controller}{
          import-module ADSync
          Start-ADSyncSyncCycle `
           -PolicyType Delta
           echo 'Performing Sync: Delta'
      }
  }
  $time = get-date
  echo "Timestamp: $time"
}

Set-Alias adsync 'Sync-ActiveDirectory'
