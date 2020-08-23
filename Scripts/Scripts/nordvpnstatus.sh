#!/bin/bash

nordvpn status &> /tmp/nordstatus
output=$(tr -d '\0' < /tmp/nordstatus)

if [[ $output == *"Connected"* ]]; then
    echo -n ""
    echo -e '\033[0;32m'$output | cut -d':' -f 3 | cut -d'.' -f 1
    exit 0
elif [[ $output == *"Disconnected"* ]]; then
    echo ""
    exit 0
fi
exit
