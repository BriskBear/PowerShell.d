<#

.SYNOPSIS
Returns the Fully Qualified Domain Name of a computer.

.DESCRIPTION
The script runs a ping -a and scrapes the return for the Name, Fully-Qualified Domain Name, and IP Address.
 It can be used with the computername or the IP address.

Furthermore it can be inserted into Scripts so that they can then be used with common computernames.

.EXAMPLE
get-fqdn mp-cadman1

Name       FQDN                     IP
----       ----                     --
mp-cadman1 mp-cadman1.cppwind.local 10.245.10.62
.EXAMPLE 
(Get-FQDN 10.245.30.4).fqdn
gd-it.cpp.windexperts.org
.EXAMPLE 
Invoke-Command -Computername (Get-FQDN gd-fs3).fqdn {"Computer: $env:ComputerName";Ping GD-FS2}
Note:
	"Invoke-Command -ComputerName gd-fs3 {"Computer: $env:ComputerName";ping GD-FS2}" returns:
	'Cannot find the computer gd-fs3'
but, the above returns: 
	Computer: GD-FS3
	Pinging gd-fs2.cpp.windexperts.org [10.245.10.67] with 32 bytes of data:
	Reply from 10.245.10.67: bytes=32 time<1ms TTL=128
	...

.NOTES
err... That's all he wrote?

.LINK
https://wiki.4winds.tools/index.php/Get-FQDN

#>

function Get-FQDN {
  [cmdletbinding()]
  param( [Parameter(Mandatory, ValueFromPipeline)]$ComputerName )
  $parse = $( Ping -a $ComputerName -n 1).split(" ")

  $Resolve = [PSCustomObject]@{
    Name = $parse[2].split('.')[0]
    FQDN = $parse[2]
    IP   = $parse[3].replace('[','').replace(']','')
  }
  return $Resolve
}
