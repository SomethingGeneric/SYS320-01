$scraped_page = Invoke-WebRequest -TimeoutSec 10 -URI http://10.0.17.19/ToBeScraped.html

# $scraped_page.Links | Select-Object outerText, href

# $h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select-Object outerText

# $h2s

$divs1 = $scraped_page.ParsedHtml.body.getElementsByTagName("div") | 
    where { $_.className -eq "div-1" } | select innerText

$divs1