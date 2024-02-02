function getLoginsAndOuts($days) {

    $loginouts = Get-EventLog System -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$days)

    $loginoutstable = @()

    for ($i=0; $i -ne $loginouts.Count; $i++) {

        $event = ""

        if ($loginouts[$i].InstanceId -eq 7001) { $event="Logon" }
        if ($loginouts[$i].InstanceId -eq 7002) { $event="Logoff" }


        $SID = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])

        $objUser = $SID.Translate([System.Security.Principal.NTAccount])

        $user = $objUser.Value


        $loginoutstable += [PSCustomObject]@{
                "Time" = $loginouts[$i].TimeGenerated;
                "Id" = $loginouts[$i].InstanceId;
                "Event" = $event;
                "User" = $user;
        }
    }

    return $loginoutstable
}

# $resTable = getLoginsAndOuts(14)

# $resTable