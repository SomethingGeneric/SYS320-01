function readConfiguration() {
    
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
        # todo
    }

    elseif ($choice -eq 2) {
        # todo
    }

    else {
        Write-Host "Unknown Option: $choice"
    }

}