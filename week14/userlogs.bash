#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){

	logs=$(cat "$authfile" | grep "authentication failure")
	dateAndUser=$(echo "$logs" | cut -d' ' -f1,2,16 | sed 's/user=//g')
	echo "$dateAndUser"

}

echo "To: matthew.compton@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp matthew.compton@mymail.champlain.edu


echo "To: matthew.compton@mymail.champlain.edu" > emailform.txt
echo "Subject: FAILED Logins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp matthew.compton@mymail.champlain.edu

