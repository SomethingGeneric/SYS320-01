$scriptpath = "C:\Users\champuser\SYS320-01\week2"

$folderpath = "$scriptpath\outfolder"

if (Test-Path $folderpath) {
    Write-Host "Folder exists"
} else {
    New-Item -Path $folderpath
}