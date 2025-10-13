#!/bin/bash

while true; do
	read1=$(awk '$3=="sda" {print $6}' /proc/diskstats)
	ts1=$(date +%s)

	sleep 1

	read2=$(awk '$3=="sda" {print $6}' /proc/diskstats)
	ts2=$(date +%s)

	delta_sectors=$((read2 - read1))
	delta_time=$((ts2 - ts1))

	sector_size=512

	bps=$((delta_sectors * sector_size / delta_time))

	echo "$(numfmt --to=si --padding=5 $bps)B/s"
done
