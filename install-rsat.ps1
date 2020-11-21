<# 
Prerequisites 1 of 2: System
- OS = Windows 10 Enterprise (tested on build versions 1809 and 1909)
- Administrator PowerShell console = Yes

Prerequisites 2 of 2: Local Policy Change (Mitigation for Add-WindowsCapability failure with error code 0x800f0954)
1. Run Local Group Policy Editor ("gpedit.msc") as an Administrator to edit your local computer policy.
2. Go to "Computer Configuration\Administrative Templates\System\".
3. While the subfolder "System" is selected, find the following policy in the right pane: "Specify settings for optional component installation and component repair".
4. Double-click the above stated policy or click "Edit policy setting".
5. Set the policy to "Enabled".
6. Select the checkbox of the policy's option labeled "Download repair content and optional features directly from Windows Update instead of Windows Server Update Services (WSUS)".
7. Click OK to save and close the policy.
#>

# Update the system's local execution policy
Set-ExecutionPolicy RemoteSigned

# Optional: View descriptions of all RSAT items
# Get-WindowsCapability -Name RSAT* -Online

# Optional: View current installation state of all RSAT items 
# Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

# Install all RSAT items
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# Optional: Update help content to include RSAT items
# Update-Help
