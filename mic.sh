#!/bin/bash

mic_source=$(pactl info | grep "Default Source" | cut -f3 -d" ")

cond=$(pactl list sources | grep -A 10 $mic_source | grep "Mute: " | cut -f2 -d" ")

if [ "$cond" == "yes" ]; then 
    echo ""
else 
    echo ""
fi
