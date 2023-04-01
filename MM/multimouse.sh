#!/bin/bash

#
#  multimouse.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.04.01
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

ts() {
    date +"%T"
}

log() {
    (echo "$(ts) ${1}") >> $sys$dir$mmlog
}

log "========================================================"
log "Multi-Mouse ${2} ${0} | ${1}"
log "========================================================"

log "Switching to ${dest} directory"
cd ${dest}

destroy() {

    log "Halting Evsieve"
    (killall evsieve | ts) >> $sys$dir$mmlog 2>&1 &

    multi_mouse_exists=$(ls -a | grep -c $mm | sort -u)
    log "Checking if symlink exits..."	
	
    if [[ $multi_mouse_exists == "1" ]]
    then
        log "Removing symbolic link"
        rm $mm
    fi
} 
case "$1" in
    start)
        log "${1}: Starting the virtual multi-mouse"        
    ;;
    stop)
        log "${1}: Stopping the virtual multi-mouse"
	destroy
        exit 0
    ;;
esac

# count usbmouse devices
usbmouse=$(ls -a | grep -c mouse)

log "Monitoring physical usb mouse devices"
while [[ $usbmouse == "0" ]]
do
    usbmouse=$(ls -a | grep -c usb)
    log "No usb mouse devices found, sleeping..."
    sleep 5
done

#ensure we are clean to start
destroy
sleep 2

log "Gather all event mouse names"
event_mouse=( $(ls -a | grep mouse) )

# init_input arg array
args=()

log "Locating all mouse devices"
log "Includes trackball, non-Apple trackpad, mouse, spinner, etc"

# Apple Magic Trackpad's slow down Spinners and Trackballs
# Therefore are removing from the Virtual Multi-Mouse
apple='Magic_Trackpad' # We may map the clicks and discard the tracking

for ev in "${event_mouse[@]}"
do 
    log "** mouse: ${ev}"
	case "${ev}" in
	    *$apple*)
	        log "Ignoring mouse input ${apple} :("      
	    ;;
	    *)
	    	log "Adding mouse Input ${ev}"
			args+=("${input} ${dest}${ev}")
	    ;;
	esac
done 

log "Setting the physical mouse inputs"
for arg in 
do
    log "${arg}"
done

count="${args[@]}}"

#log "This value is our initial global mouse index for player one" 
#log "Set global.retroarch.input_player1_mouse_index ${mi}" 

#batocera-settings-set global.retroarch.input_player1_mouse_index $int
#log "batocera-settings-set global.retroarch.input_player1_mouse_index ${count}"

args+=("${output} ${name}${mm} ${create}${dest}${mm}")

log "Setting the virtual mouse output"
log "${output} ${name}${mm} ${create}${dest}${mm}"

log "Creating our Virtual Multi-Mouse"
(evsieve ${args[@]} | ts) >> $sys$dir$mmlog 2>&1 &

sleep $delay
log "Evsieve Started..."

sys='/userdata/system/'
spt='scripts/'
vmm='mm.sh'
$sys$spt$vmm init We are the Champions $1

# The watcher starts here:
log "Starting the USB watcher..."

hot=$(ls -a | grep usb)
swp=$hot

log "Monitor physical event-mouse devices"
while [[ $hot == $swp ]]
do
    sleep $delay
    swp=$(ls -a | grep usb)
	sleep $delay
done

destroy
sleep 2
##(kill -9 $! | ts) >> $sys$dir$mmlog 2>&1 &
log "Restarting Virtual Multi-Mouse..."
($sys$script start) &
