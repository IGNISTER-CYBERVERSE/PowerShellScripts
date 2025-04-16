# OrganizeFiles.ps1
# Organizes files in a folder into subfolders by file type

$folder = "C:\Users\zephy\Downloads"

$files = Get-ChildItem -Path $folder -File
foreach ($file in $files) {
    $ext = $file.Extension.TrimStart('.')
    if (-not [string]::IsNullOrWhiteSpace($ext)) {
        $dest = Join-Path $folder $ext
        if (-not (Test-Path $dest)) {
            New-Item -Path $dest -ItemType Directory
        }
        Move-Item -Path $file.FullName -Destination $dest
    }
}

Write-Host "✅ Files organized in $folder"
