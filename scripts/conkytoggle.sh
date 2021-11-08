#!/usr/bin/env bash

# Get list Of Conky PIDs
runningConkeys=$(pgrep -a conky)

# If there are zero running conkys, start conky
if [[ -z "$runningConkeys" ]]; then
   conky -q &
# else kill conky
else 
    echo "$runningConkeys" | xargs -n 1 kill -15 
fi
