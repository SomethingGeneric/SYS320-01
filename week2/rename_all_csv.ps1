$scriptpath = "C:\Users\champuser\SYS320-01\week2"

$files = Get-ChildItem -Recurse -Include *.csv

$files | Rename-Item -NewName { $_.Name -replace '.csv', '.log'}

Get-ChildItem -Recurse