Set-Location C:\Users\champuser\SYS320-01\week7

. (Join-Path $PSScriptRoot .\Configuration.ps1)
. (Join-Path $PSScriptRoot .\Email.ps1)
. (Join-Path $PSScriptRoot .\Scheduler.ps1)
. (Join-Path $PSScriptRoot .\Event-Logs.ps1)

$configuration = readConfiguration

$Failed = atRiskUsers $configuration.Days

SendAlertEmail "Suspicous Activity" ($Failed | Format-Table | Out-String)

ChooseTimeToRun $configuration.ExecutionTime