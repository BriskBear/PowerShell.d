# Dependencies Nmap.exe
function Quick-Nmap() {
  try { nmap --hel 2>&1 > $null } catch {
    Write-Host -ForegroundColor 'Red' 'Nmap not available, Download from: https://nmap.org/dist/nmap-7.95-setup.exe'
    return
  }

  nmap -sn -T5 --min-parallelism 99 10.0.0.1/24
}

Set-Alias 'qnmap' 'Quick-Nmap'
