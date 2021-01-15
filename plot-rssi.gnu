#!/usr/bin/gnuplot
#
# Plot bandwidth
#
# AUTHOR: Mike Kotsch

set encoding utf8
set terminal jpeg enhanced size 800,500
set title 'Bandwidth \& signal strength'
set output 'plot.jpg'
set grid x y
set xlabel 'Time in seconds'
set ylabel 'Signal strength in dBm'
set tics scale 1
set border linewidth 1.5
set style line 1 lt 1 lw 1 pt 19 linecolor rgb "green"
set autorange x
set yrange[0:100]

plot 'rssi.dat' using 1:2 title 'RSSI' with lines ls 1, \
     'rssi.dat' using 1:3 title 'Noise' with lines ls 2

pause 1
reread
