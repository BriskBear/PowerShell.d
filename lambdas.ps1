$Confirm   = { param($Prompt='Confirm (y/n)') ; if ($(Read-Host -Prompt $Prompt) -match 'y') {$True} else {$False} }
$GetWinKey = { (Get-ItemProperty 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\' -Name BackupProductKeyDefault).backupproductkeydefault }

