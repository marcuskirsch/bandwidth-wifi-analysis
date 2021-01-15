#!/bin/bash

tput civis

t=0

while (($t <= $1)); do sh get-neighbours.sh; t=$(( t+1 )); sleep 5; done

tput cnorm
