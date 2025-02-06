# Vars
$CredDir = "$env:USERPROFILE\.config\.cred"

# Lambdas
$ClearClip    = { Set-ClipBoard $null }
$Decrypt2Clip = { param($FilePath) gpg -d $FilePath 2>$null | Set-ClipBoard  }
$GetKey       = { (gpg -k|findstr '(').split('(')[1].split(')')[0] }


# Functions
function Clip-Key($FilePath) {
  # Confirm the requested keyfile exists
  if(!(Test-Path -PathType 'Leaf' -Path "$CredDir\$FilePath")) {
    throw "$FilePath is not found in $CredDir"
  }

  # Decrypt Password to clipboard
  &$Decrypt2Clip -FilePath "$CredDir\$FilePath"
  sleep 5      # Wait to use the Password
  &$ClearClip  # Clear the clipboard
}

function Lock-Key($FilePath) {
  # Confirm credentials directory
  if (!(Test-Path -PathType 'Container' -Path $CredDir)) { mkdir -p $CredDir }

  $ekey = &$GetKey

  # Hide input while collecting the password to encrypted file
  Read-Host -MaskInput -Prompt "$FilePath" | gpg -ao "$CredDir\$FilePath" -se -r $ekey
}
