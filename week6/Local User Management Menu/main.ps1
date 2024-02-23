. (Join-Path $PSScriptRoot .\Users.ps1)
. (Join-Path $PSScriptRoot .\Event-Logs.ps1)
. (Join-Path $PSScriptRoot .\String-Helper.ps1)

clear

$Prompt  = "Please choose your operation:`n"
$Prompt += "1 - List Enabled Users`n"
$Prompt += "2 - List Disabled Users`n"
$Prompt += "3 - Create a User`n"
$Prompt += "4 - Remove a User`n"
$Prompt += "5 - Enable a User`n"
$Prompt += "6 - Disable a User`n"
$Prompt += "7 - Get Log-In Logs`n"
$Prompt += "8 - Get Failed Log-In Logs`n"
$Prompt += "9 - Get At-Risk Users`n"
$Prompt += "10 - Exit`n"



$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if($choice -eq 10){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
        $enabledUsers = getEnabledUsers
        Write-Host ($enabledUsers | Format-Table | Out-String)
    }

    elseif($choice -eq 2){
        $notEnabledUsers = getNotEnabledUsers
        Write-Host ($notEnabledUsers | Format-Table | Out-String)
    }


    # Create a user
    elseif($choice -eq 3){ 

        $name = Read-Host -Prompt "Please enter the username for the new user"

        if ( checkUser $name -eq $true ) {
            Write-Host "There is already a user called $name"
        } else {

            $password = Read-Host "Enter a password: "

            if (checkPassword $password -eq $true) {
                $hashPW = ConvertTo-SecureString $password -AsPlainText -Force
                createAUser $name $hashPW
                Write-Host "User: $name is created." | Out-String
            } else {
                Write-Host "You didn't meet the password requirements.\nTry Again."
            }
        }
    }


    # Remove a user
    elseif($choice -eq 4){

        $name = Read-Host -Prompt "Please enter the username for the user to be removed"

        if (checkUser $name) {

            removeAUser $name

            Write-Host "User: $name Removed." | Out-String

        } else {

            Write-host "Can't remove someone who doesn't exist."

        }
    }


    # Enable a user
    elseif($choice -eq 5){


        $name = Read-Host -Prompt "Please enter the username for the user to be enabled"

       if (checkUser $name) {

            enableAUser $name

            Write-Host "User: $name Enabled." | Out-String

        } else {

            Write-Host "No such user $name"

        }
    }


    # Disable a user
    elseif($choice -eq 6){

        $name = Read-Host -Prompt "Please enter the username for the user to be disabled"

        if (checkUser $name) {

            disableAUser $name

            Write-Host "User: $name Disabled." | Out-String
        } else {

            Write-Host "No such user $name"

        }
    }


    elseif($choice -eq 7){

        $name = Read-Host -Prompt "Please enter the username for the user logs"

        if (checkUser $name) {

            $days = Read-Host "How many days of logs should we grab? : "

            $userLogins = getLogInAndOffs $days

            Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
        } else {

            Write-Host "No Such user $name"

        }
    }


    elseif($choice -eq 8){

        $name = Read-Host -Prompt "Please enter the username for the user's failed login logs"

        if (checkuser $name) {

            $days = Read-Host "How many days of logs should we grab? : "

            $userLogins = getFailedLogins $days

            Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)


        } else {

            Write-Host "No such user: $name"

        }
    }

    elseif($choice -eq 9) {

        $days = Read-Host "How many days of logs should we grab? : "

        Write-Host "Here's a list of affected users:"

        Write-Host (getFailedLogins $days | Group-Object -Property User | Where-Object { $_.Count -gt 9} | Select Count, Name | Out-String)


    }


    else {

        Write-Host "Unknown option $choice. Try again`n`n"

    }

}




