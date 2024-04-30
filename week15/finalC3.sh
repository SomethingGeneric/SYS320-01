#!/usr/bin/env bash

if [[ ! -f report.txt ]]; then
	echo "Please run C2 first to generate a report"
	exit 1
fi

cat << EOF > report.html
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
}
</style>
</head>
<body>
<h1>Logs with IOC indicators:</h1>
<table>
EOF

while IFS='' read -r line || [[ -n "$line" ]]; do
# loop from https://stackoverflow.com/a/35872326
	echo "$line" | awk '{print "<tr><td>" $1 "</td><td>" $2 "</td><td>" $3 "</td></tr>"}' >> report.html
done < "report.txt"

echo "</table>" >> report.html
echo "</body>" >> report.html
echo "</html>" >> report.html
