#!/bin/bash

echo -e "\n##################################"
echo "#### IP settings"
ifconfig 2>&1

echo -e "\n##################################"
echo "#### Route settings"
netstat -nr 2>&1

echo -e "\n##################################"
echo "#### DNS settings"
scutil --dns 2>&1

echo -e "\n##################################"
echo "#### Resolv test"
time host www.google.com 2>&1

echo -e "\n##################################"
echo "#### MTR to DCtwr"
mtr -nrc 5 188.92.41.254 2>&1

echo -e "\n##################################"
echo "#### MTR to Cesnet"
mtr -nrc 5 147.32.88.1 2>&1

