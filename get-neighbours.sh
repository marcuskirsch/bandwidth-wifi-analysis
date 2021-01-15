#!/bin/bash

c=0
header=''

# old method
airport -s| sed -n '2,$p' | sed 's/,+1//' | sed 's/,-1//' | awk '{print $4,'\t',$3,'\t',$1}' | sort -k1 -n | sed '/^-/ d' > neighbours.dat

sort -k3 -u neighbours.dat | awk '{print $3}' > neighbours-ssids.dat
sort -k1 -n -u neighbours.dat | awk '{print $1}' > neighbours-channels.dat

cs=$(wc -l < neighbours-ssids.dat)
cc=$(wc -l < neighbours-channels.dat)

for (( i = 0; i < $cs; i++ )); do
  tmp=$(awk 'NR=='$i neighbours-ssids.dat)
  header+=' '$tmp
done

echo $header > plot.dat

for (( i = 1; i < $cc; i++ )); do
  ctmp=$(awk 'NR=='$i neighbours-channels.dat)
  printf '%s ' $ctmp >> plot.dat

  for (( j = 1; j < $cs; j++ )); do
    stmp=$(awk 'NR=='$j neighbours-ssids.dat)
    x=$(grep -E "$ctmp.*$stmp" neighbours.dat | awk '{print $2}' | tail -n 1)

    if [[ ! -z $x ]]; then
      n=$((x+100))
      printf '%s ' $n >> plot.dat
    else
      printf '? ' >> plot.dat
    fi

  done
  printf '\n' >> plot.dat

done

gnuplot -e 'count'="$cs" plot-neighbours.gnu

mv neighbour-plot.jpg _images\/neighbour\/neighbour-plot_$(date +%F-%H-%M).jpg # && open _images\/neighbour\/neighbour-plot_$(date +%F-%H-%M).jpg
rm neighbours.dat neighbours-ssids.dat neighbours-channels.dat plot.dat
