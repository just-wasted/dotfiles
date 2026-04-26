#!/usr/bin/bash

export WP_ID=$(wpctl status --name | grep 'alsa_output.usb-BEHRINGER_UMC204HD_192k-00.HiFi__Line1__sink \[Audio/Sink]' | cut -c 9-10) && wpctl set-default $WP_ID
