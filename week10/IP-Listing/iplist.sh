#!/usr/bin/env bash

[[ ! "$#" == "1" ]] && echo "Usage: $0 <net_prefix>" && exit 1

prefix=$1

[[ ${#prefix} -lt 5 ]] && printf "Prefix length too short\nExample: 10.0.17\n" && exit 1

for i in $(seq 1 255); do

	echo "$prefix.$i"

done
