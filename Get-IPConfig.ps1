<#
.SYNOPSIS
This module will output the IP Configuration of either a local or remote computer. 
Without arguments, the module queries the local computer, showing only connected network interfaces.

.DESCRIPTION
Display the IP configuration of either a local or remote computer.

.EXAMPLE
./Get-IPConfig.ps1 $Computer

.NOTES
Check the system's PowerShell module path: $Env:psmodulepath
Install this PowerShell module on to a system for all users: $Env:ProgramFiles\WindowsPowerShell\Modules\<Module Folder>\<Module Files>.

.LINK
https://github.com/ramonpichardo/scripts-powershell-windows10/new/master/Get-IPConfig.ps1
#>

function Get-IPConfig{
param ( $Computer="localhost",
		$OnlyConnectedNetworkAdapters=$true
	  )
	  
gwmi -Class Win32_NetworkAdapterConfiguration -ComputerName $Computer | Where { $_.IPEnabled -eq $OnlyConnectedNetworkAdapters } | Format-List @{ Label="ComputerName"; Expression= { $_.__SERVER }}, IPEnabled, Description, MACAddress, IPAddress, IPSubnet, DefaultIPGateway, DHCPEnabled, DHCPServer, @{ Label="DHCP Lease Expires"; Expression= { [dateTime]$_.DHCPLeaseExpires }}, @{ Label="DHCP Lease Obtained"; Expression= { [dateTime]$_.DHCPLeaseObtained }}
}
