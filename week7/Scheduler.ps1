function ChooseTimeToRun($Time){
    $scheduledTasks = Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}

    if($scheduledTasks -ne $null) {
        Write-Host "Task Already exists" | Out-String
        DisableAutoRun
    }

    Write-Host "Creating new task." | Out-String

    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"C:\Users\champuser\SYS320-01\week7\main.ps1`""
    $trigger = New-ScheduledTaskTrigger -Daily -At $Time
    $principal = New-ScheduledTaskPrincipal -UserId 'champuser' -RunLevel Highest
    $settings = New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -WakeToRun

    $task = New-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -Settings $settings

    Register-ScheduledTask -TaskName "myTask" -InputObject $task

    Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}

}

function DisableAutoRun() {
    $scheduledTasks = Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}

    if ($scheduledTasks -ne $null) {
        Write-Host "Disabling Task" | Out-String
        Unregister-ScheduledTask -TaskName "myTask" -Confirm:$false
    }

    else {
        Write-Host "Task does not exist" | Out-String
    }

}