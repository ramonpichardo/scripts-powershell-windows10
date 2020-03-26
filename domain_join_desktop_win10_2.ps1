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

$computername = "winpc01"
$desc = "Development & QA Remote PC"
$group1 = "acme\sg_local_srvr_admins"
$group2 = "acme\sg_wkstn_admins"

# Update the computer description (description attribute) in Active Directory
Set-ADComputer $computername -Description $desc

# Add AD domain security groups to the computer's local security group "Administrators"
Add-LocalGroupMember -Group "Administrators" -Member $group1, $group2

# Add AD domain security groups to the computer's local security group "Remote Desktop Users"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $group1, $group2

# Dynamically register the computer's hostname and IP address with Active Directory DNS
ipconfig /registerdns

# Force update domain group policies for all users and the computer itself
gpupdate /force

# Log off the currently logged on account
logoff
