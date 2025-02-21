#!/bin/bash

swayidle  \
	timeout 300 'wlr-randr --output HDMI-A-1 --off' resume 'wlr-randr --output HDMI-A-1 --on'
