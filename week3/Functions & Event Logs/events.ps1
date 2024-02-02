. (Join-Path $PSScriptRoot "loginevents.ps1")
. (Join-Path $PSScriptRoot "powerevents.ps1")

$logins = getLoginsAndOuts(14)
$logins

$powevents = getPowerEvents(14)
$powevents