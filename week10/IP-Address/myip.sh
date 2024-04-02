#!/usr/bin/env bash

ip addr | grep -v "inet6" | grep "inet" | grep -v "127.0.0.1" | awk '{print $2}' | awk '{split($0, a, "[/]"); print a[1]}'
