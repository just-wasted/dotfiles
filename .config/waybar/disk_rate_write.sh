#!/bin/bash

###  get count of memory pages dirtied (marked for write to disk) 
###  and calc the data transfer rate

while true; do
	read1=$(awk '$1=="nr_dirtied" {print $2}' /proc/vmstat)
	
	# get unix time in millis 
	ts1=$(($(date +%s%N) / 1000000 ))

	sleep 2

	read2=$(awk '$1=="nr_dirtied" {print $2}' /proc/vmstat)
	ts2=$(($(date +%s%N) / 1000000 ))

	delta_pages=$((read2 - read1))
	delta_time=$((ts2 - ts1))

	page_size=4096

	bps=$(((delta_pages * page_size / delta_time) * 1000))
	echo "$(numfmt --to=si --padding=5 $bps)B/s"
done

###  below is for actual blocks written, can vary greatly to the upper
###  because filesystem magic
#
# while true; do
# 	read1=$(awk '$3=="sda" {print $10}' /proc/diskstats)
#
# 	# get unix time in millis 
# 	ts1=$(($(date +%s%N) / 1000000 ))
#
# 	sleep 2
#
# 	read2=$(awk '$3=="sda" {print $10}' /proc/diskstats)
# 	ts2=$(($(date +%s%N) / 1000000 ))
#
# 	delta_sectors=$((read2 - read1))
# 	delta_time=$((ts2 - ts1))
#
# 	sector_size=512
#
# 	bps=$(((delta_sectors * sector_size / delta_time) * 1000))
# 	echo "$(numfmt --to=si --padding=7 $bps)B/s"
# done
