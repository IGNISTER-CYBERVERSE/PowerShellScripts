# RemoveEmptyFolders.ps1
# Deletes all empty folders in a given directory

$path = "C:\Users\zephy\Downloads"  # Change this to your target folder

$emptyFolders = Get-ChildItem -Path $path -Recurse -Directory | 
    Where-Object { @(Get-ChildItem -Path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue).Count -eq 0 }

foreach ($folder in $emptyFolders) {
    Remove-Item $folder.FullName -Force -Recurse
    Write-Host "Deleted empty folder: $($folder.FullName)"
}

Write-Host "Empty folders removed."
