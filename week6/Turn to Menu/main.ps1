. (Join-Path $PSScriptRoot .\parselogs.ps1)
. (Join-Path $PSScriptRoot .\Event-Logs.ps1)

#clear

$Prompt = "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display users with more than 9 failed logins in the last x days`n"
$Prompt += "4 - Start Chrome web browser and navigate it to champlain.edu`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
        $apacheLogs = ApacheLogs1
        Write-Host ($apacheLogs | Format-Table | Out-String)
    }

    elseif($choice -eq 2){
        $days = Read-Host "How many days of logs should we grab? : "
        $failedLogins = getFailedLogins $days
        Write-Host ($failedLogins | Format-Table | Out-String)
    }

    elseif($choice -eq 3){
        $days = Read-Host "How many days of logs should we grab? : "
        Write-Host "Here's a list of affected users:"
        Write-Host (getFailedLogins $days | Group-Object -Property User | Where-Object { $_.Count -gt 9} | Select-Object Count, Name | Out-String)
    }

    elseif($choice -eq 4){
        Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList "https://champlain.edu"
    }

    else {
        Write-Host "Invalid choice" | Out-String
    }
}