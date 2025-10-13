#!/bin/bash

RX=/sys/class/net/enp0s31f6/statistics/rx_bytes
INTERVAL=1

prev_rx="$(cat "$RX")"
while true; do
	sleep $INTERVAL
	rx="$(cat "$RX")"
	rxps=$(((rx - prev_rx) / INTERVAL))
	prev_rx="$rx"
	echo "$(numfmt --to=si $rxps)"
done
