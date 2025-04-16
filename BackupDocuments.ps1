# BackupDocuments.ps1
# Copies all files from Documents to a backup folder with timestamp

$source = "$env:USERPROFILE\Documents"
$backupRoot = "$env:USERPROFILE\Backups"
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupFolder = "$backupRoot\Backup_$timestamp"

# Create backup folder
New-Item -Path $backupFolder -ItemType Directory -Force

# Copy files
Copy-Item -Path "$source\*" -Destination $backupFolder -Recurse

Write-Host "Documents backed up to: $backupFolder"
