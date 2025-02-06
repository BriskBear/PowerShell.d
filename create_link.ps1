. $PSScriptRoot\lambdas.ps1

# Create the link, replacing if it already exists
$NewLink = { param($Target, $Name) ; New-Item -Itemtype SymbolicLink -Value $Target -Path $Name -Force }

# If the path already exists ask if it should be replaced
function Create-Link($LinkTarget, $LinkName) {
  $LinkTarget = (Get-Item $LinkTarget).FullName

  if(Test-Path $LinkName) {
    if ($(&$Confirm -Prompt "Replace $($LinkName)?")) { &$NewLink $LinkTarget $LinkName } else { "Cancelled" }
  } else {
    try {
      &$NewLink $LinkTarget $LinkName
    } catch { $_ ; "Name: $LinkName" ; "Target: $LinkTarget" }
  }
}

Set-Alias ln 'Create-Link'
