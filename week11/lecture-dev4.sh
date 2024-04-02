#!/usr/bin/env bash

file="/var/log/apache2/access.log"

cat "$file" | cut -d' ' -f7 | sort | uniq -c

