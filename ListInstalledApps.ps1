# ListInstalledApps.ps1
# Lists installed programs from registry

Write-Host "==== Installed Applications ===="

$keys = @(
  "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
  "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
  "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

foreach ($key in $keys) {
    Get-ItemProperty $key -ErrorAction SilentlyContinue | 
    Where-Object { $_.DisplayName } |
    Select-Object DisplayName, DisplayVersion, Publisher | 
    Sort-Object DisplayName
}
