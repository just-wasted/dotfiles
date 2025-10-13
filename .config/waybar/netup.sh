#!/bin/bash

TX=/sys/class/net/enp0s31f6/statistics/tx_bytes
INTERVAL=1

prev_tx="$(cat "$TX")"
while true; do
	sleep $INTERVAL
	tx="$(cat "$TX")"
	txps=$(((tx - prev_tx) / INTERVAL))
	prev_tx="$tx"
	echo "$(numfmt --to=si $txps)"
done
