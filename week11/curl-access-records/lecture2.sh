#!/usr/bin/env bash

file="/var/log/apache2/access.log"

cat "$file" | cut -d' ' -f1,12 | grep 'curl' | sort | uniq -c

