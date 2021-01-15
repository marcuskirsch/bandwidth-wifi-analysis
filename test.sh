#!/bin/bash

t=0
rm rssi.dat

printf '' > rssi.dat

writedata() {
  while (( 1 )); do printf '%s ' $t >> rssi.dat && airport -I | grep -e agrCtlRSSI -e agrCtlNoise | awk 'NR%2{printf "%s ",$0;next;}1' | awk '{print ((100+$2)), ((100+$4))}' >> rssi.dat; t=$(( t+1 )); sleep 1; done
}

writedata &
sleep 1
gnuplot plot-rssi.gnu
