$scriptpath = "C:\Users\champuser\SYS320-01\week2\Powershell Lab 1 (Basic)"

cd $scriptpath

$files = (Get-ChildItem)

for ($j=0; $j -le $files.Length; $j++) {

    if ($files[$j].Extension -ilike "*.ps1") {

        Write-Host $files[$j].BaseName

    }

}