#!/bin/bash
TOGGLE=$(amixer get Master | tail -n1 | awk '{printf $NF}')
VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")

if [ "$VOL" -eq 0 -o "$TOGGLE" = "[off]" ]; then
    printf "婢 --"
elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
    printf " %s%%" "$VOL"
elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
    printf "墳 %s%%" "$VOL"
else
    printf " %s%%" "$VOL"
fi
