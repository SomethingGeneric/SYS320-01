#!/usr/bin/env bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

	echo -n "Please Input an Instructor Full Name: "
	read instName

	echo ""
	echo "Courses of $instName :"
	cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
	sed 's/;/ | /g'
	echo ""

}

function courseCountofInsts(){

	echo ""
	echo "Course-Instructor Distribution"
	cat "$courseFile" | cut -d';' -f7 | \
	grep -v "/" | grep -v "\.\.\." | \
	sort -n | uniq -c | sort -n -r 
	echo ""

}

function classesInRoom(){

	echo ""

	printf "Input a classroom name: "
	read inp

	echo ""
	echo "Courses in $inp :"
	echo ""

	cat "$courseFile" | grep "$inp" |  cut -d';' -f1,2,5,6,7 | sed 's/;/ | /g'
	
}

function seatsInClasses(){
	
	echo ""

	printf "Input a subject name: "
	read inp

	echo ""
	echo "Courses with open seats in $inp :"
	echo ""

	cat "$courseFile" | grep "$inp" |  cut -d';' -f1,2,3,5,6,7,8,9,10 | sed 's/;/ | /g'
	
}

while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display courses of a classroom"
	echo "[4] Display available courses of subject"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break #i love you!

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		classesInRoom

	elif [[ "$userInput" == "4" ]]; then
		seatsInClasses

	else

		echo "What u doing? Try again"

	fi
done
