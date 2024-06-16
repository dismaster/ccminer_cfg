#!/bin/bash
x=`ping -c1 google.com 2>&1 | grep unknown`
if [ ! "$x" = "" ]; then
        echo "It's down!! Attempting to restart."
        su -c svc wifi disable
        su -c svc wifi enable
fi