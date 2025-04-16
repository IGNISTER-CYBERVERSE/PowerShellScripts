# SystemInfo.ps1
# Outputs basic system info

Write-Host "==== System Information ===="

Write-Host "`nOperating System:"
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object Caption, OSArchitecture, Version

Write-Host "`nCPU:"
Get-CimInstance -ClassName Win32_Processor | Select-Object Name, NumberOfCores

Write-Host "`nRAM:"
Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | 
ForEach-Object { "{0:N2} GB" -f ($_.Sum / 1GB) }

Write-Host "`nDisk Space:"
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | 
Select-Object DeviceID, @{Name="FreeSpace(GB)";Expression={[math]::Round($_.FreeSpace/1GB, 2)}}, 
@{Name="Size(GB)";Expression={[math]::Round($_.Size/1GB, 2)}}
