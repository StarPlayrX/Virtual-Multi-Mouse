#!/bin/bash

#
#  mm.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

# Reference
# https://wiki.batocera.org/launch_a_script

#!/bin/bash

# version
version='1.0.6'

# variables
mouse='Virtual_Multi_Mouse'
logfile="retroarch.log"
dir='/userdata/system/logs/'
logfile='retroarch.log'
cmd='batocera-settings-set'
input='global.retroarch.input_player1_mouse_index'
err='Error: mouse not found'
mmlog='mm.log'
delay=1

log() {
	(echo "${1}" | ts) >> $userdata$dir$mmlog
}

log "=========================================================="
log "Multi-Mouse ${version} | ${0} | ${1}"              
log "=========================================================="

seek() {
	mouse_str=$(awk -F'[:"]' -v name="${mouse}" '/Mouse #/ && $4==name {print $2}' "${dir}${logfile}")
	index=$(echo $mouse_str | awk -F'#' '{print $2}')
}

enable() {
	log "Enabling retroarch log file"
	$cmd global.retroarch.log_dir $dir
	$cmd global.retroarch.log_to_file true
	$cmd global.retroarch.log_to_file_timestamp false
}

update() {
	if [ -n "${index}" ]
	then
    	log "Multi-Mouse success: ${cmd} ${input} ${index}"
    	$cmd $input $index
	fi
}

case $1 in
    gameStart)
		sleep $delay
		seek
		update
	;;
    gameStop)
		seek
		update
	;;
	init)
		sleep $delay
		enable
	;;
    *)
        echo ""
		echo Usage $0  gameStart  gameStop  init
        echo ""
    ;;
esac
