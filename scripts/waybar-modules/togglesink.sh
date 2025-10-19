#!/bin/bash
### get the non-default audio sink and make it default
### works ONLY with two 2 audio sinks
non_default_sink_id=$(wpctl status | awk '/Audio/ {in_audio=1} in_audio \
				&& /Sinks:/ {in_sinks=1; next} in_sinks \
				&& /Sources:/ {exit} in_sinks \
				&& $2!="*" {print $2}')

 
# when awk hits 'Audio' it sets in_audio=1, same for 'Sinks:' while in audio.
# 'next' skips the current line of 'Sinks:'. when we are in_sinks and hit 'Sources:'
# parsing is stopped. Lines that dont have '*' as second string contain 
# the non-default sink, with the ID as second string, print it!

# echo $non_default_sink_id

wpctl set-default $non_default_sink_id

