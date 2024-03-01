function readConfiguration() {
    $fileContent = Get-Content -Path "configuration.txt"
    $foo = [PSCustomObject]@{
        "Days" = $fileContent.Split("\n")[0];
        "ExecutionTime" = $fileContent.Split("\n")[1];
    }

    return $foo
}

$Prompt = "Please choose your operation:`n"
$Prompt += "1 - Display config`n"
$Prompt += "2 - Change config`n"
$Prompt += "3 - Exit`n"

$operation = $true

while($operation){
    Write-Host $Prompt | Out-String
    $choice = Read-Host 

    if ($choice -eq 3) {
        $operation = $false
    }

    elseif ($choice -eq 1) {
        $boy = readConfiguration
        #Write-Host "Days of logs to pull: $($boy.Days)"
        #Write-Host "Time of day to run script: $($boy.ExecutionTime)"
        Write-Host ($boy | Format-Table | Out-String )
    }

    elseif ($choice -eq 2) {
        $newDays = Read-Host "Enter new days of logs to pull: "
        $newTime = Read-Host "Enter new time of day to run script: "
        $newConfig = "$newDays`n$newTime"
        Set-Content -Path "configuration.txt" -Value $newConfig
        Write-Host "Configuration updated"
    }

    else {
        Write-Host "Unknown Option: $choice"
    }

}