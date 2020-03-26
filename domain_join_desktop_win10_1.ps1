# Launch this script in an administrative PowerShell session.
#Requires -RunAsAdministrator

# Verify this script is running in an administrator security context.
$IsAdmin=[Security.Principal.WindowsIdentity]::GetCurrent()
If ((New-Object Security.Principal.WindowsPrincipal $IsAdmin).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator) -eq $FALSE)
{
      "`nERROR: This script will only run in an administrator context. Run this script after launching a Run As Administrator PowerShell session."
      pause
      exit
}

$tz = "Pacific Standard Time"
$domain = "acme.net"
$cred = "acme\janep"
$ou = "OU=Win10,OU=Workstations,DC=acme,DC=net"

# Quietly set PowerShell execution policy from default ("Restricted") to "RemoteSigned"
echo Setting the execution policy to RemoteSigned...
Set-ExecutionPolicy RemoteSigned -Confirm:$False

# Set time zone from default (UTC) to Pacific Standard Time
Set-TimeZone -Name $tz

# Join computer to domain and place computer account in correct OU that is GPO'd for Windows 10 workstations
Add-Computer -DomainName $domain -Credential $cred -OUPath $ou -Restart
