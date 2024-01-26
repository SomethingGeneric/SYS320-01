cd 'C:\Users\champuser\SYS320-01\week2'

Get-Service | Where-Object { $_.Status -eq "Stopped" } | Export-Csv "stopped_services.csv"