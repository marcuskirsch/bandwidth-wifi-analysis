#!/bin/bash

# get width of terminal window
c=`tput cols`

# width without the text
w=$(( c-25 ))

# helper
q=$(echo "scale=5; $w/$1" | bc)

# adjust sleep timer
s=$(echo "scale=5; 1/$q" | bc)

printf '⚡️ Measuring bandwidth\r'

tmp=''
space=''

for (( i = 0; i < $w; i++ )); do
  space+=' '
done

for (( i = 0; i < $w; i++ )); do
  tmp+='#'
  printf '⚡️ Measuring bandwidth [%s%s]\r' $tmp ${space:i+1}
  sleep $s
done

printf '✅ Measuring bandwidth  %s \r' $space
printf '\n'
