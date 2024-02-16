function translateDayData() {

    param (
        [String]$inp
    )

    $daysfound = @()

    if ($inp -ilike "M*") { $daysfound += "Monday" }
    if ($inp -ilike "*T[TWF]*") { $daysfound += "Tuesday" }
    if ($inp -ilike "*W") { $daysfound += "Wednesday" }
    if ($inp -ilike "*TH") { $daysfound += "Thursday" }
    if ($inp -ilike "*F") { $daysfound += "Friday" }

    return $daysfound

}

function gatherClasses() {

    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.19/Courses.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    $fulltable = @()

    for ($i=1; $i -ne $trs.length; $i++) {

        $tds = $trs[$i].getElementsByTagName("td")

        # $tds

        $Times = $tds[5].innerText.Split("-")
        
        $fulltable += [PSCustomObject]@{ "Class Code" = $tds[0].innerText;
                                         "Title" = $tds[1].innerText;
                                         "Days" = translateDayData($tds[4].innerText);
                                         #"Days Raw" = $tds[4].innerText; # here for debuggin
                                         "Time Start" = $Times[0];
                                         "Time End" = $Times[1];
                                         "Instructor" = $tds[6].innerText;
                                         "Location" = $tds[9].innerText;
        }

    }

    return $fulltable

}

# gatherClasses