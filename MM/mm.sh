#!/bin/bash

#
#  mm.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.04.01
#
# Reference
# https://wiki.batocera.org/launch_a_script

vmm='Virtual_Multi_Mouse'
logfile="retroarch.log"
dir='/userdata/system/logs/'
logfile='retroarch.log'
cmd='batocera-settings-set'
input='global.retroarch.input_player1_mouse_index'
err='Error: mouse not found'
mmlog='mm.log'
delay=1

# todo clean up on aisle 6
dest='/dev/input/by-id/'
sys='/userdata/system/'
mm='Virtual_Multi_Mouse'

ts() {
    date +"%T"
}

log() {
    (echo "$(ts) ${1}") >> $dir$mmlog
}

log "==========================================================================="
log "Multi-Mouse ${6} | ${0} | ${1}"
log "Platform: ${2}"
log " Library: ${3}"
log "  Engine: ${4}"
log "     ROM: ${5}"               
log "==========================================================================="

update() {
    cd ${dest}

    log "Virtual USB Mouse Tracker by StarPlayrX"
    log "(C) 2023 by Todd Bruss | StarPlayrX.com"
    event_mouse=($(ls -a | grep mouse))

    # init usb mouse array  
    physical=()

    log "Locating all mouse devices"
    log "Includes trackball, trackpad, mouse, spinner, etc"

    #Get everymouse
    for mouse_name in "${event_mouse[@]}"
    
    do   
        event=$(/usr/bin/udevadm info ${dest}${mouse_name} -q name)
        key=$(echo ${event} | sed 's/[^0-9]*//g')
        log "${key} ${mouse_name} ${event}"
        physical[key]="${mouse_name}"
    done

    #Get our Virtual_Mouse
    log "Virtual Mouse: ${mm}"
    evt=$(/usr/bin/udevadm info $dest${mm} -q name)
    key=$(echo ${evt} | sed 's/[^0-9]*//g')
    physical[key]="${mm}"

    # Sort the array by key
    sorted_by_key=$(for key in "${!physical[@]}"; do echo "$key ${physical[$key]}"; done | sort -k1)
    log "Sorted by key:${sorted_by_key}"

    #Apple's Trackpad is an ABS device. We need to remove it from the index.
    apple='Magic_Trackpad' # Figure out how (REL) and (ABS) are ID'd
    
    # Loop through the sorted array and get the index and value
    index=0
    mighty_mouse=0
    for item in "${physical[@]}"
    do
         log "Mouse $index#: $item"
	 
         # This is our exception list
	 case "${item}" in
	    *$apple*)
	        log "Ignoring mouse input ${apple} (ABS)"      
	    ;;
	    *)
	    	log "Adding mouse Input (REL) ${ev}"
		
 	 	if [[ $item == $mm ]] 
		then
                    $cmd $input $index 
                    log "Success: ${cmd} ${input} ${index}"
	            mighty_mouse=1	     
	        fi	 
                ((index++))
	    ;;
	esac

    done

    if [[ $mighty_mouse == 0 ]]
    then
	log "Could not set Virtual Multi-Mouse"
    fi
}

case $1 in
    gameStart)
	update 
    ;;
    gameStop|pregame|init)
	update	
    ;;
    *)
    echo ""
    echo "Usage  ${0}  gameStart  gameStop  init  pregame"
    echo ""
    ;;
esac
