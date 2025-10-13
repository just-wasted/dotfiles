RX=/sys/class/net/enp0s31f6/statistics/rx_bytes
TX=/sys/class/net/enp0s31f6/statistics/tx_bytes
INTERVAL=1

prev_rx="$(cat "$RX")"
prev_tx="$(cat "$TX")"
while true; do
	sleep $INTERVAL
	rx="$(cat "$RX")"
	tx="$(cat "$TX")"
	rxps=$(((rx - prev_rx) / INTERVAL))
	txps=$(((tx - prev_tx) / INTERVAL))
	prev_rx="$rx"
	prev_tx="$tx"
	# echo "$(numfmt --padding=5 --to=si $txps)\r $(numfmt --padding=5 --to=si $rxps)"
	pretty_txps=$(numfmt --to=si $txps)
	pretty_rxps=$(numfmt --to=si $rxps)
	padded_txps=$(printf %10s $txps)
	padded_rxps=$(printf %10s $rxps)
	echo "{\"text\": \"$padded_txps\", \"alt\": \"$padded_rxps\", \"class\": \"active\", \"tooltip\": \"\"}"
done
