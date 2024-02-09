function countIPs {

    param(
        [string]$page,
        [string]$hcode,
        [string]$browser
    )

    $notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String "$hcode" | Select-String "$browser" | Select-String "$page"

    $regexp = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

    $ipsUnorganized = $regexp.Matches($notfounds)

    $ips = @()

    for($i=0; $i -lt $ipsUnorganized.Count; $i++) {
        $ips += [PSCustomObject]@{"IP" = $ipsUnorganized[$i].Value;}
    }

    $ipsoftens = $ips | Where-Object {$_.IP -ilike "10.*" }
    $counts = $ipsoftens | Group-Object IP

    $counts | Select-Object Count, Name


}


# countIPs "nope1.html" "404" "curl"