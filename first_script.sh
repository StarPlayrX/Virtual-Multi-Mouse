#!/bin/bash

#  first_script.sh
#  log_scraper
#
#  Created by MizterB on 11/30/22.
#  Updated to work with Multi Mouse 1.0.1
#

# On Batocera v35 or later place first_script.sh in:
# /userdata/system/configs/emulationstation/scripts/game-start/
# you will have to create /scripts and /game-start directories manually
# cd /userdata/system/configs/emulationstation/scripts/game-start/
# chmod ./first_script.sh

# see
# https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/10

# NAME OF DESIRED MOUSE INPUT
mouse_name="01A_Multi_Mouse"

# log file must be enabled
batocera-settings-set global.retroarch.log_dir "/userdata/system/logs/"
batocera-settings-set global.retroarch.log_to_file true
batocera-settings-set global.retroarch.log_to_file_timestamp false

# mouse index
mouse_index=$(sed -En "s~.*Mouse #(.*): \"$mouse_name\".*~\1~p" /userdata/system/logs/retroarch.log | tail -1)
if [[ -z "$mouse_index" ]]; then
	echo mouse_not_found
else 
	echo mouse_found on index: $mouse_index
	batocera-settings-set global.retroarch.input_player1_mouse_index $mouse_index
fi
