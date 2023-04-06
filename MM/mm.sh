#!/bin/bash

#
#  mm.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.04.06
#
# Reference
# https://wiki.batocera.org/launch_a_script

version='1.1.2'

vmm='Virtual_Multi_Mouse'
sys='/userdata/system/'
dir='logs/'
dest='/dev/input/by-id/'
set='batocera-settings-set'
one='global.retroarch.input_player1_mouse_index'
vmm_log='mm.log'

separator="============================================================================"
secondary="----------------------------------------------------------------------------"

# init
relative=()
absolute=()

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

# behavior - evmapy will always try to fill an empty event mouse slot
# if there are no empty slots, evmapy will add a slot at the end
# evampy is an event mangager that Batocera uses for keyboard and game controller mappings
# virtual multi-mouse does not use evmapy for its virtual mouse, be must account for evmapy's positioing

map_ai() {
 
    mapfile -t evmap_array < <(/usr/bin/evmapy --list-all | sort -V)
   
    c=$(cat /tmp/evmapy.txt)
    y=0
    f=0
  
    for z in "${evmap_array[@]}" 
    do
        # we can catch this running with a delay in a subshell
        if echo $z | grep -q "evmapy"
	then
           log "${z} confirmed"
 	   echo $y > /tmp/evmapy.txt
           f=1
           break
        else
	   log "${z}"
        fi
  
	# gap detected
        if ! echo $z | grep -q "dev/input/event${y}"
        then

            if [[ $c == $y ]] 
	    then
	       log "/dev/input/event${y}: evmapy confirmed-"
	    else 
 	       log "/dev/input/event${y}: evmapy empty slot"
	    fi

            f=1
            break
        fi
        ((y++))
    done

    if [[ $f == 0 ]]
    then
         # on game end we can compare notes and confirm
         if [[ $c == $y ]] 
	 then
	    log "/dev/input/event${y}: evmapy confirmed+"
	        else 
 	    log "/dev/input/event${y}: evmapy added"
         fi
    fi

    relative["${y}"]="evmapy"
}


vmm_ai() {
    cd ${dest}
	
    log "Virtual Multi-Mouse Central Intelligence"
    log "(c) 2023 by Todd Bruss | GTX | StarPlayX"
    
    event_mouse=($(ls -a | grep mouse))

    log $secondary
    
    # init usb mouse array  
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
	else
	    absolute[key]="${mouse_name}"
	fi
    done
 
    #Get our Virtual_Mouse
    evt=$(/usr/bin/udevadm info $dest${vmm} -q name)
    key=$(echo ${evt} | sed 's/[^0-9]*//g')
    relative[key]="${vmm}"
}

dev_ai() {
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
}

usb_ai() {
    # Loop through the sorted array and get the index and value
    
    mighty=0 
    index=0

    for item in "${relative[@]}"
    do 
	log "rel #${index}: ${item}"

 	if [[ $item == $vmm ]] 
	then
    	    ((mighty=$index))     
            $set $one $mighty
        fi	 
        ((index++))
    done
       
    if [[ $mouse == 0 ]]
    then
	log "Could not set the global index for player one"
    else 
        log "Success: ${set} ${one} ${mighty}"
    fi

    #((index++))
  
    for item in "${absolute[@]}"
    do 
	log "abs #${index}: ${item}"	 
        ((index++)) 
    done
}

start() { 
    # sleep hooks into evmapy
    sleep 0.666    
    vmm_ai
    map_ai
    dev_ai
    usb_ai 
}

stop() { 
    vmm_ai
    map_ai
    dev_ai
    usb_ai  
}

case $1 in
    gameStart)
	#& hooks into evmapy
	start & 
    ;;
    gameStop)
	stop
    ;;
    pregame)
	start	
    ;;
    *)
    echo
    echo "Usage  ${0}  gameStart  gameStop  pregame"
    echo
    ;;
esac
