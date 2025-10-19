#!/bin/bash

# write wofi selection in TOOL
TOOL=$(ls ~/scripts/tools/ | wofi --dmenu --width=15% --height=200)

# check if file exists and is executable, run it
if [ -f ~/tools/"${TOOL}" ] && [ -x ~/tools/"${TOOL}" ]; then
	~/tools/"${TOOL}";
else
	exit 1;
fi
