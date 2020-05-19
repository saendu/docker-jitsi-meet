#!/bin/bash
timestamp=`date +%Y/%m/%d-%H:%M:%S`
ip=`curl -s https://hostpapastatus.com/ip/ | grep -ioE "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`
oldip=$(cat ip.txt)
if [[ $ip == $oldip ]]; then
    echo "IP ($ip) not changed at $timestamp"
else
    echo $ip > ip.txt
    ez-ipupdate -S zoneedit -u $DYN_USER:$DYN_SECRET -h $DYN_HOST -a $ip
    echo "IP ($ip) last updated at $timestamp"
fi