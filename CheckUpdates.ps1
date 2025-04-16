# CheckUpdates.ps1
# Checks for pending Windows updates

Write-Host "==== Checking for Windows Updates ===="

Install-Module PSWindowsUpdate -Force -Scope CurrentUser
Import-Module PSWindowsUpdate

# Show list of available updates
Get-WindowsUpdate
