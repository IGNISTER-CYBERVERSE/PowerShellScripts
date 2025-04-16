# ListUsers.ps1
# Lists all local user accounts and group memberships

Write-Host "==== Local Users ===="
Get-LocalUser | Select-Object Name, Enabled, LastLogon

Write-Host "`n==== Local Groups and Members ===="
Get-LocalGroup | ForEach-Object {
    Write-Host "`nGroup: $($_.Name)"
    Get-LocalGroupMember -Group $_.Name | Select-Object Name, ObjectClass
}
