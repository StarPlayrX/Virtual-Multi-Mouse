#!/bin/bash

#
#  multimouse.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.26
#

version='1.0.6'

# variables
script='custom.sh'
input='--input'
dest='/dev/input/by-id/'
userdata='/userdata/system/'
output='--output'
mm='Virtual_Multi_Mouse'
name='name='
create='create-link='
dir='/logs/'
mmlog='multimouse.log'
logfile='retroarch.log'
delay=1

log() {
 (echo "${1}" | ts) >> $userdata$dir$mmlog
}

log "========================================================"
log "Multi-Mouse ${version} ${0} | ${1}"
log "========================================================"

log "Switching to ${dest} directory"
cd ${dest}

destroy() {
	log "Halting Evsieve"
	
	(killall evsieve | ts) >> $userdata$dir$mmlog 2>&1 &
	sleep $delay
	
	multi_mouse_exists=$(ls -a | grep -c $mm)
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

log "Counting physical usb pointing devices"
mi=$(ls -a | grep -c mouse)
log "Found $mi physical event mouse devices"

# if no event-mouse devices are present sleep and re-run
if [[ $mi == "0" ]] 
then 
	log "No event-mouse are present input devices, sleeping for 10 seconds..."
 	destroy #sleeps for 1 second 
 	sleep 9
 	($userdata$script start) &
 	exit 0
fi

log "This value is  our global mouse index for player one" 
log "Set global.retroarch.input_player1_mouse_index ${mi}" 
batocera-settings-set global.retroarch.input_player1_mouse_index $mi

log "Resetting Retroarch log"
rm -f $userdata$dir$logfile

log "Gather all event mouse names"
event_mouse=( $(ls -a | grep mouse) )

# init_input arg array
args=()

log "Locating all mouse devices"
log "Includes trackballs, trackpads, mice, spinners, etc"

for ev in "${event_mouse[@]}"
do 
    log "** mouse: ${ev}"
    args+=("${input} ${dest}${ev}")
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
(evsieve ${args[@]} | ts) >> $userdata$dir$mmlog 2>&1 &

log "Evsieve has started"

# The watcher starts here:
log "Starting USB watcher..."

hot=$(ls -a | grep mouse)
swp=$hot

log "Monitor physical event-mouse devices"
while [[ $hot == $swp ]]
do
    sleep $delay
    swp=$(ls -a | grep mouse)
done

log "USB physical event mouse devics list been updated!"

log "Destroying the previous virtual multi-mouse"
destroy

log "Sleeping for 5 seconds..."
sleep 5

log "Restarting the virtual multi-mouse now..."
($userdata$script start) &
