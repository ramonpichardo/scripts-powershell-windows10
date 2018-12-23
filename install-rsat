# Prerequisites:
# OS = Windows 10 Enterprise version 1809
# Install Windows Optional Feature = Remote Server Administration Tools (RSAT)
# Administrator PowerShell console = Yes

Set-ExecutionPolicy RemoteSigned

# View descriptions of all RSAT items
Get-WindowsCapability -Name RSAT* -Online

# View current installation state of all RSAT items 
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State

# Install all RSAT items
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# Update help content to include RSAT items
Update-Help
