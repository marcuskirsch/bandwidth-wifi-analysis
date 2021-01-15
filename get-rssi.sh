#!/bin/bash

t=0

while (($t <= $1)); do printf $t' ' && airport -I | grep -e agrCtlRSSI -e agrCtlNoise | awk 'NR%2{printf "%s ",$0;next;}1' | awk '{print ((100+$2)), ((100+$4))}'; t=$(( t+1 )); sleep 1; done > rssi.dat

# gnuplot -e 'time'=$1 plot-rssi.gnu

# mv plot.jpg images\/rssi_plot_$(date +%F-%H-%M).jpg && open images\/rssi_plot_$(date +%F-%H-%M).jpg
# rm rssi.dat
