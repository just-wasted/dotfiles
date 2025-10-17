#!/bin/bash

swayidle  \
	timeout 300 'niri msg output HDMI-A-1 off' resume 'niri msg output HDMI-A-1 off'

# swayidle -w timeout 601 'niri msg action power-off-monitors' timeout 600 'swaylock -f' before-sleep 'swaylock -f'
