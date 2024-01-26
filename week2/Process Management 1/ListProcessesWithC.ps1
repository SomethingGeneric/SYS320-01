Get-Process | ForEach-Object {

    if ($_.ProcessName -ilike "C*") {

        Write-Host $_.ProcessName

    }

}