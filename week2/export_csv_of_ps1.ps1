$scriptpath = "C:\Users\champuser\SYS320-01\week2"

cd $scriptpath

$files = Get-ChildItem

$folderpath = Join-Path $scriptpath "outfolder"

$filePath = Join-Path $folderpath "out.csv"

$files | Where-Object { $_.Extension -eq ".ps1" } | Export-Csv -Path $filePath