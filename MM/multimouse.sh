#!/bin/bash

#
#  multimouse.sh
#
#  Multi-Mouse
#
#  MM 1.0.5
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

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

cd ${dest}

log() {
 (echo "${1}" | ts) >> $userdata$dir$mmlog
}

log "========================================================"
log "Multi Mouse 1.0.5 ${0} | ${1}"
log "========================================================"

destroy() {
	log "Halting Evsieve"
	killall evsieve
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
 
log "Starting up Multi-Mouse..."
log "Switching to ${dest} directory"

case "$1" in
    start)
        log "${1}: starting multi-mouse"
		destroy        
		;;
    stop)
        log "${1}: stopping multi-mouse"
		destroy
        exit 0
		;;
      *)
        log "No matching arguments $0 $1"
        echo "Usage: $0  start  stop"
      	;;
esac

log "Counting event-mouse devices"
log "This becomes our mouse index" 

mi=$(ls -a | grep -c mouse)
log "Found $mi event mouse devices"

# if no event-mouse devices are present sleep and re-run
if [[ $mi == "0" ]] 
then 
	log "No event-mouse input devices, sleeping for 10 seconds..."
 	destroy #sleeps for 1 second 
 	sleep 9
 	($userdata$script start) &
 	exit 0
fi

log "Resetting Retroarch log"
rm -f $userdata$dir$logfile

log "Set global.retroarch.input_player1_mouse_index ${mi}" 
batocera-settings-set global.retroarch.input_player1_mouse_index $mi

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

log "Monitor event-mouse list"
while [[ $hot == $swp ]]
do
    sleep $delay
    swp=$(ls -a | grep mouse)
done

log "USB Event Mouse chain has been updated!"

log "Destroying the previous Virtual Mouse"
destroy

log "Sleeping for 5 seconds..."
sleep 5

log "Restarting Multi-Mouse..."

($userdata$script start) &output