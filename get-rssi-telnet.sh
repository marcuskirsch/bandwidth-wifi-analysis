#!/bin/expect


while true; do wl rssi XX:XX:XX:XX:XX:XX | awk '{printf $1}' && wl noise | awk '{print " ", $1}'; sleep 1; done
