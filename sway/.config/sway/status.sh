#!/bin/sh
while true; do
    CAP=$(cat /sys/class/power_supply/macsmc-battery/capacity)
    STAT=$(cat /sys/class/power_supply/macsmc-battery/status)
    DATE=$(date +'%Y-%m-%d %H:%M:%S')
    echo "BAT: $CAP% ($STAT) | $DATE"
    sleep 1
done
