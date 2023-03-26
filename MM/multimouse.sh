#!/bin/bash

#
#  multimouse.sh
#
#  Multi-Mouse
#
#  MM 1.0.4
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

# variables
script='multimouse.sh'
input='--input'
dest='/dev/input/by-id/'
userdata='/userdata/system/'
output='--output'
mm='ZZ_Multi_Mouse_MM'
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

(echo "Welcome to Multi Mouse 1.0.4" | ts) > $userdata$dir$mmlog
  log "============================"

destroy() {
	log "Halting Evsieve"
	killall evsieve
	sleep $delay
	multi_mouse_exists=$(ls -a | grep -c $mm)
	log "Checking if symlink exits..."	
	if [ $multi_mouse_exists == "1" ]
	then
		log "Removing symbolic link"
		sleep $delay
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

if [[ $mi == "0" ]] 
then 
 log "No event-mouse input devices, sleeping..."
 sleep $delay
 ($userdata$script start) &
 destroy 
 exit 0
fi

log "Set global.retroarch.input_player1_mouse_index ${mi}" 
batocera-settings-set global.retroarch.input_player1_mouse_index $mi

log "Updating Retroarch logfile"
echo "[INFO] [udev]: Mouse #${mi}: "${mm}" (REL) /dev/input/eventMM" > $userdata$dir$logfile

log "Gather all event mouse names"
event_mouse=( $(ls -a | grep mouse) )

# init_input arg array
args=()

# create input args
for ev in "${event_mouse[@]}"
do 
    log "** mouse: ${ev}"
    args+=("${input} ${dest}${ev}")
done

# add output arg
args+=("${output} ${name}${mm} ${create}${dest}${mm}")

for arg in "${args[@]}}"
do
    log "*** arg: ${arg}"
done

destroy

log "Creating our multi mouse"
log "Starting up Evsieve"

log "Most important piece to the puzzle"
(evsieve ${args[@]}) &

log "Evsieve has started"
log "Starting usb watcher..."

hot=$(ls -a | grep mouse)
swp=$hot

log "Monitor event-mouse list"
while [[ $hot == $swp ]]
do
    sleep $delay
    swp=$(ls -a | grep mouse)
done

log "usb-event-mouse chain has been updated"

destroy

log "Sleeping for 5 seconds..."
sleep 5

log "Restarting Multi-Mouse..."

($userdata$script start) &