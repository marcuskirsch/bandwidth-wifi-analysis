#!/usr/bin/gnuplot
#
# Plot bandwidth
#
# AUTHOR: Mike Kotsch


reset
set encoding utf8
set terminal jpeg enhanced size 800,500 enhanced font 'Arial,10'
set title 'Bandwidth \& signal strength'
set output 'plot.jpg'
set grid x y
set xlabel 'Time in seconds'
set ylabel 'MBits per second'
set y2label 'Signal strength in dBm'
set tics scale 0.75
set border linewidth 1.5
set style line 1 lt 1 lw 1 pt 19 linecolor rgb "green"
set xrange[0:time]
set yrange[0:120]
set y2range[0:100]

plot 'plott.dat' using 4 title 'Bandwidth' with lines ls 1, \
     'plott.dat' using 2 title 'RSSI' with lines ls 2, \
     'plott.dat' using 3 title 'Noise' with lines ls 3
