#!/bin/bash
timestamp=`date +%Y/%m/%d-%H:%M:%S`
ez-ipupdate -S zoneedit -u blacktr:$DYN_SECRET -h afterworkbeer.com
echo "IP last updated at $timestamp"