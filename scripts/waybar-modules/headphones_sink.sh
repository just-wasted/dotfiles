#!/usr/bin/bash

export WP_ID=$(wpctl status --name | grep 'alsa_output.pci-0000_00_1f.3.analog-stereo' | cut -c 9-10) && wpctl set-default $WP_ID
