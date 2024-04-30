#!/usr/bin/env bash

curl http://10.0.17.5/IOC.html \
| xmlstarlet select --template --copy-of "//html//body//table//tr//td" \
| sed 's/<\/td>/;/g' | sed 's/<td>//g' | cut -d';' -f1,3,5,7,9,11 \
| sed 's/;/\n/g' > IOC.txt
