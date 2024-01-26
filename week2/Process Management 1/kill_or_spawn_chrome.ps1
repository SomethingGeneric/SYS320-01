$foundChrome = $false

Get-Process | ForEach-Object {

    if ($_.ProcessName -eq 'chrome') {
        $foundChrome = $true
    }

}

if ($foundChrome) {

    Get-Process | ForEach-Object {

        if ($_.ProcessName -eq 'chrome') {
            $_.Kill() # this fails sometimes if one chrome process dies and signals the others before we get to it
            # but hey we haven't covered error handling yet.
        }

    }

} else {

    Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe" -ArgumentList "https://champlain.edu"

}