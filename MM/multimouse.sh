#!/bin/bash

#
#  multimouse.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.26
#

script='custom.sh'
input='--input'
dest='/dev/input/by-id/'
sys='/userdata/system/'
scr='scripts/'
vmm='mm.sh'
output='--output'
mm='Virtual_Multi_Mouse'
name='name='
create='create-link='
dir='/logs/'
mmlog='multimouse.log'
logfile='retroarch.log'
delay=1

log() {
    (echo "${1}" | ts) >> $sys$dir$mmlog
}

log "========================================================"
log "Multi-Mouse ${2} ${0} | ${1}"
log "========================================================"

log "Switching to ${dest} directory"
cd ${dest}

destroy() {
log "Halting Evsieve"
	
(killall evsieve | ts) >> $sys$dir$mmlog 2>&1 &

sleep $delay
	
    multi_mouse_exists=$(ls -a | grep -c $mm | sort -u)
    log "Checking if symlink exits..."	
	
    if [ $multi_mouse_exists == "1" ]
    then
        log "Removing symbolic link"
        rm $mm
        sleep $delay
    fi
} 
case "$1" in
    start)
        log "${1}: Starting the virtual multi-mouse"
	destroy        
    ;;
    stop)
        log "${1}: Stopping the virtual multi-mouse"
	destroy
        exit 0
    ;;
    *)
    log "No matching arguments $0 $1"
	echo ''
    echo "Usage: $0  start  stop"
	echo ''
    ;;
esac

log "Counting physical mouse pointing devices"
mi=$(ls -a | grep -c mouse | sort -u)
log "Found $mi physical event mouse devices"

# if no event-mouse devices are present sleep and re-run
if [[ $mi == "0" ]] 
then 
    log "No event-mouse are present input devices, sleeping for 10 seconds..."
    destroy #sleeps for 1 second 
    sleep 9
    ($sys$script start) &
    exit 0
fi

#log "This value is our global mouse index for player one" 
#log "Set global.retroarch.input_player1_mouse_index ${mi}" 
#batocera-settings-set global.retroarch.input_player1_mouse_index $mi

log "Gather all event mouse names"
event_mouse=( $(ls -a | grep mouse | sort -u) )

# init_input arg array
args=()

log "Locating all mouse devices"
log "Includes trackballs, trackpads, mice, spinners, etc"

# Apple Magic Trackpad's slow down Spinners and Trackballs
# Therefore are removing from the Virtual Multi-Mouse
apple="usb-Apple_Inc._Magic_Trackpad"

for ev in "${event_mouse[@]}"
do 
    log "** mouse: ${ev}"
	case "${ev}" in
	    *$apple*)
	        log ":( Ignoring mouse input ${apple} :("      
	    ;;
	    *)
	    log "Adding mouse Input ${ev}"
		args+=("${input} ${dest}${ev}")
	    ;;
	esac
done 

log "Setting the physical mouse inputs"
for arg in "${args[@]}}"
do
    log "*** arg: ${arg}"
done

args+=("${output} ${name}${mm} ${create}${dest}${mm}")

log "Setting the virtual mouse output"
log "${output} ${name}${mm} ${create}${dest}${mm}"

log "Creating our Virtual Multi-Mouse"
(evsieve ${args[@]} | ts) >> $sys$dir$mmlog 2>&1 &

sleep $delay
log "Evsieve Started..."

# preflight retroarch's mouse index - hotswappable
#log "Running Preflight (HotSwappable USB-Mouse)..."
#$sys$scr$vmm prep Get Ready Player One! $2

#log "Heat Seeking Missle Test Area..."
#$sys$scr$vmm game Virtual Multi Mouse Rocks $2

# The watcher starts here:
log "Starting the USB watcher..."

hot=$(ls -a | grep mouse | sort -u)
swp=$hot

log "Monitor physical event-mouse devices"
while [[ $hot == $swp ]]
do
    sleep 2.5
    swp=$(ls -a | grep mouse | sort -u)
done

log "Restarting Virtual Multi-Mouse..."
($sys$script start) &