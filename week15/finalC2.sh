#!/usr/bin/env bash

function usage(){
	echo "do $0 <path_to_log> <path_to_IOC.txt>"
	exit 1
}

if [[ "$1" == "" ]]; then
	echo "Give me a file input for the log to parse"
	usage
fi

if [[ ! -f "$1" ]]; then
	echo "The thing you gave me as the log isn't a file!"
	usage
fi


if [[ "$2" == "" ]]; then
	echo "The path to the IOC list wasn't given"
	usage
fi

if [[ ! -f "$2" ]]; then
	echo "You didn't point me to a file for the IOC list"
	usage
fi

#echo "Log: $1"
#echo "IOC: $2"

for i in $(cat "$2"); do
	grep "$i" access.log | awk '{print $1 " " $4 " " $7}' | sed 's/\[//g' >> report.txt
done
