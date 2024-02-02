function getPowerEvents($days) {

    $shutdowns = Get-EventLog System -Source EventLog -After (Get-Date).AddDays(-$days) | Where {$_.EventId -in "6006","6005"}

    $shutdownstable = @()

    for ($i=0; $i -ne $shutdowns.Count; $i++) {

        $event = ""

        if ($shutdowns[$i].EventId -eq 6006) { $event="Shutdown" }
        if ($shutdowns[$i].EventId -eq 6005) { $event="Start" }

        $user = "System"


        $shutdownstable += [PSCustomObject]@{
                "Time" = $shutdowns[$i].TimeGenerated;
                "Id" = $shutdowns[$i].EventId;
                "Event" = $event;
                "User" = $user;
        }
    }

    return $shutdownstable
}

# getPowerEvents(14)