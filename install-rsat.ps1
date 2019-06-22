# Prerequisites:
# OS = Windows 10 Enterprise version 1809
# Install Windows Optional Feature = Remote Server Administration Tools (RSAT)
# Administrator PowerShell console = Yes

# Mitigation for Add-WindowsCapability failure with error code 0x800f0954 :
# Run "gpedit.msc" (Local Group Policy Editor) to edit your local computer policy
# Go to "Computer Configuration\Administrative Templates\System\Specify settings for optional component installation and component repair"
# Double-click the above policy or click "Edit policy setting"
# Set the policy to "Enabled"
# Enable the option by selecting the checkbox labeled "Download repair content and optional features directly from Windows Update instead of Windows Server Update Services (WSUS)"
# Click OK to save and close the policy

Set-ExecutionPolicy RemoteSigned

# View descriptions of all RSAT items
Get-WindowsCapability -Name RSAT* -Online

# View current installation state of all RSAT items 
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

# Install all RSAT items
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# Update help content to include RSAT items
Update-Help
