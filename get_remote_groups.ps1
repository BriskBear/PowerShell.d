
function Get-RemoteGroups {
  param(
    [Parameter(Mandatory=$True)]$ComputerName,
    [Parameter()]$Groups = @("Administrators", "Remote Desktop Users")
  )
  # Import External Tools
  . $PSScriptRoot\shortcut_invoke.ps1
  . $PSScriptRoot\..\access_tools\lib\validate_ad_object.ps1

  # A place to store GroupMembers
  $members = @{
    "raw"    = New-Object System.Collections.Arraylist
    "result" = New-Object System.Collections.Arraylist
  }

  # Pull the plain group-names from the remote machine
  foreach ($Group in $Groups) {
    [void]$members['raw'].add(
      (
        Shortcut-Invoke `
         -ComputerName $ComputerName `
         -Block "Get-LocalGroupMember -Group `"$Group`""
      ).Name
    )
  }

  # Convert the plain group-names to User's first + last
  foreach ($gp_list in $members.raw) {
    foreach($user_group in $gp_list) {
      [void]$members.result.add($(
        if ($user_group -match $ComputerName.ToUpper()) { "$user_group" } else {
          (Validate-Object "$user_group").Name
        }
      ))
    }
  }

  # Return the results
  return $members.result
}
