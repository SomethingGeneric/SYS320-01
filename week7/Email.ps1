function SendAlertEmail($Subject, $Body){
    $From = "matthew.compton@mymail.champlain.edu"
    $To = $From

    $Password = Get-Content ./app.txt | ConvertTo-SecureString -AsPlainText -Force

    $Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $From, $Password

    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -Port 587 -UseSsl -Credential $Cred

}

SendAlertEmail "SYS 320 Test" "Hello! This is a test email for the Email Report script"
