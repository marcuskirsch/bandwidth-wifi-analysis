#!/bin/bash

tput civis

sh loader.sh $1 & sh get-rssi.sh $1 & iperf3 -f mM -t $(($1 + 1)) -c 192.168.1.42 5201 --logfile test.dat

sleep $(($1+1))

printf '🤖 Analysing data\r'

# delete the first 4 and the last 5 lines of a file
sed -n '4,$p' test.dat | sed -e :a -e '$d;N;2,6ba' -e 'P;D' | sed '/^\s*$/d' > clean.dat # cut header of iperf file
awk '{print($7)}' clean.dat > cleaner.dat
paste rssi.dat cleaner.dat > plott.dat

sleep 0.5

printf '✅ Analysing data\r'

sleep 0.5

printf '\n'
printf '📈 Plotting results\r'
gnuplot -e 'time'=$1 plot-bandwidth.gnu

sleep 0.5

printf '✅ Plotting results\r'
mv test.dat _data\/data_$(date +%F-%H-%M).dat
mv plot.jpg _images\/plot\/plot_$(date +%F-%H-%M).jpg && open _images\/plot\/plot_$(date +%F-%H-%M).jpg
rm clean.dat plott.dat rssi.dat cleaner.dat
printf '\n'

tput cnorm
