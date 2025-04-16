# StartupCleanup.ps1
# Deletes temp files and empties Recycle Bin

Write-Host "🧹 Cleaning up temp files and Recycle Bin..."

# Clean temp folder
$temp = "$env:TEMP\*"
Remove-Item $temp -Force -Recurse -ErrorAction SilentlyContinue

# Empty Recycle Bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

Write-Host "✅ Cleanup complete."
