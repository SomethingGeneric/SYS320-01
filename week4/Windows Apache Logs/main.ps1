. (Join-Path $PSScriptRoot "apache-logs.ps1")

# used a bash loop w/ curl loop from xubuntu
# to generate these
countIPs "nope1.html" "404" "curl"

# used a powershell loop w/ Invoke-WebRequest from Windows
# sidenote: why is Mozilla in the curl/Invoke-WebRequest useragent lol
countIPs "nope1.html" "404" "Mozilla" 