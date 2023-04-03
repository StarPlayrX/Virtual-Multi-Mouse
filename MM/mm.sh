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

version='1.0.10'

vmm='Virtual_Multi_Mouse'
sys='/userdata/system/'
dir='logs/'
dest='/dev/input/by-id/'
set='batocera-settings-set'
one='global.retroarch.input_player1_mouse_index'
vmm_log='mm.log'

separator="============================================================================"
secondary="----------------------------------------------------------------------------"

ts() {
    date +"%T"
}

log() {
    (echo "$(ts) ${1} ${2}") >> $sys$dir$vmm_log
}

log $separator
log "VMM vers : $version" 
log " Runtime : ${0} ${1}"
log "Platform : ${2}"
log " Library : ${3}"
log "  Engine : ${4}"
log "     ROM : ${5}"               
log $secondary

update() {
    cd ${dest}
	
    log "usb Virtual Mouse Tracker & udev Reader"
    log "(c) 2023 by Todd Bruss | StarPlayrX.com"
    
    event_mouse=($(ls -a | grep mouse))

    log $secondary
    
    # init usb mouse array  
    relative=()
    #absolute=()

    #log "Locating all relative mouse devices"
    #log "Includes trackball, mouse & spinner"

    #Get everymouse
    for mouse_name in "${event_mouse[@]}"
    
    do   
	rel=$(/usr/bin/udevadm info -q property ${dest}${mouse_name}* | grep -ic "id_input_mouse=1")
        event=$(/usr/bin/udevadm info ${dest}${mouse_name} -q name)
        key=$(echo ${event} | sed 's/[^0-9]*//g')
	if [[ $rel == "1" ]]
	then
	    relative[key]="${mouse_name}"
	    #echo "rel $key ${relative[key]}"
	else
	    absolute[key]="${mouse_name}"
	    #echo "abs $key ${absolute[key]}"
	fi
    done
 
    #Get our Virtual_Mouse
    evt=$(/usr/bin/udevadm info $dest${vmm} -q name)
    key=$(echo ${evt} | sed 's/[^0-9]*//g')
    relative[key]="${vmm}"
        
    #evmapy is a pain in the rear
    mapfile -t x < <(/usr/bin/evmapy --list-all | sort -V)

    y=0

    found=0

    for z in "${x[@]}" 
    do
        if ! echo $z | grep -q "dev/input/event${y}"
        then
            found=1
            break
        fi
        ((y++))
    done

    if [[ $found == 0 ]]
    then
        ((y++))
    fi

    relative["${y}"]="evmapy"
 
    ## Sort relative
    for key in "${!relative[@]}"
    do 
	echo "$key ${relative[$key]}"
    done | sort -V #-k1
    
    ## Sort absolute 
    for key in "${!absolute[@]}"
    do  
	echo "$key ${absolute[$key]}"
    done | sort -V #-k1    

    # Loop through the sorted array and get the index and value
    
    mouse=0 
    index=0

    for item in "${relative[@]}"
    do 
	log "rel #${index}: ${item}"

 	if [[ $item == $vmm ]] 
	then
            mouse=$index	     
        fi	 
        ((index++))
    done
       
    if [[ $mouse == 0 ]]
    then
	log "Could not set the global index for player one"
    else
	$set $one $mouse
	log $secondary 
        log "Success: ${set} ${one} ${mouse}"
    fi

    #((index++))
  
    for item in "${absolute[@]}"
    do 
	log "abs #${index}: ${item}"	 
        ((index++)) 
    done
}

case $1 in
    gameStart)
	update 
    ;;
    gameStop|pregame|init)
	update	
    ;;
    *)
    echo
    echo "Usage  ${0}  gameStart  gameStop  init  pregame"
    echo
    ;;
esac
