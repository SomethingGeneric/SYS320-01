Get-Process | ForEach-Object {

    if ($_.Path -notlike "*system32*" ) {

        $info = "Name: " + $_.Name
        $info += " Path: " + $_.Path

        Write-Host $info
        Write-Host "--------------"

    }

}