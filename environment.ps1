# Load config.yml into $config
function Configure {
  $config = @{}

  @(Get-Content $PSScriptRoot\..\config.yml) | ForEach-Object {
    $line = [regex]::split("$_", '[:,#]').trim()
    $config["$($line[0])"] = Invoke-Expression "$($line[1..($line.length - 1)] -join ':')"
  }

  return $config
}

$config = Configure
