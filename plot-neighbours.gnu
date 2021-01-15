#!/usr/bin/gnuplot
#
# Plot neighbour wifis
#
# AUTHOR: Mike Kotsch

reset
set encoding utf8
set terminal jpeg enhanced size 800,500 enhanced font 'Verdana,10'
set title 'Neighbour WiFi'
set output 'neighbour-plot.jpg'

set style data histogram
set style histogram cluster gap 1

set style fill solid
set boxwidth 1
set xtics format ""
set xlabel 'Channel'

set grid ytics
set yrange [0:*]
set ylabel 'RSSI in dBm'

plot for [i=1:count] 'plot.dat' using i:xtic(1) title columnhead, \
