#!/bin/bash

TOOL=$(ls ~/tools/ | wofi --dmenu --width=15% --height=200)

if [ -f ~/tools/"${TOOL}" ]; then
	~/tools/"${TOOL}";
else
	exit 1;
fi
