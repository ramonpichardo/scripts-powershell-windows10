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

# Set the execution policy to RemoteSigned:
echo Setting the execution policy to RemoteSigned...
Set-ExecutionPolicy RemoteSigned

# Install Nuget
Install-PackageProvider Nuget –Force

# Install PowerShellGet
Install-Module -Name PowerShellGet -Force

# Chocolatey installation procedure to be run in an administrative PowerShell session:
echo Please wait for the Chocolately installation to complete...
echo NOTE: If the installation appears to have stalled or stopped posting display output allow 60 seconds to pass and then press the Enter key.
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Remediate the error: "WARNING: Not setting tab completion:…"
echo Remediating the tab completion error...
New-Item -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -ItemType File

$hereString = @"
# Chocolatey profile
`$ChocolateyProfile = "`$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    if (Test-Path(`$ChocolateyProfile)) {
    Import-Module "`$ChocolateyProfile"
    }
"@
	
echo $hereString >> $env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
. $profile

# Install list of infra apps via Chocolatey:
echo Installing list of apps via the Chocolatey Package Manager...
choco install chocolatey-core.extension firefox googlechrome adobereader git.install mremoteng putty.install rvtools terraform vlc winpcap winscp.install wireshark xmind 7zip.install -y
