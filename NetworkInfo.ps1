# NetworkInfo.ps1
# Displays IP address, MAC address, and network adapter info

Write-Host "==== Network Information ===="

Get-NetIPConfiguration | ForEach-Object {
    Write-Host "`nInterface Alias:" $_.InterfaceAlias
    Write-Host "IPv4 Address:" $_.IPv4Address.IPAddress
    Write-Host "Default Gateway:" $_.IPv4DefaultGateway.NextHop
    Write-Host "DNS Servers:" ($_.DNSServer.ServerAddresses -join ', ')
    Write-Host "MAC Address:" $_.InterfaceDescription
}
