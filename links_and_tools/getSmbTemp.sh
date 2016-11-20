#!/bin/bash
HOST="celly-rt"
HOST="192.168.1.1"
ssh root@$HOST 'smartctl --all $(blkid | grep "LABEL=\"data\"" | cut -d ":" -f1 | sed -e "s/2//")' 2>/dev/null | grep Temperature_Celsius | awk '{print $NF}'
