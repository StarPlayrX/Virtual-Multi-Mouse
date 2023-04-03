#!/bin/bash
#
#  multimouse.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.04.01
#

script='multimouse.sh'
input='--input'
dest='/dev/input/by-id/'
sys='/userdata/system/'
scr='scripts/'
mmsh='mm.sh'
output='--output'
vmm='Virtual_Multi_Mouse'
name='name='
create='create-link='
dir='/logs/'
mm_log='multimouse.log'
delay=1

ts() {
    date +"%T"
}

log() {
    (echo "$(ts) ${1}") >> $sys$dir$mm_log
}

separator="========================================================"

log $separator
log "VMM 1.0.10: ${0} ${1} ${2}"
log $separator

log "Switching to ${dest} directory"
cd ${dest}

destroy() {
    log "Halting evsieve"
    /usr/bin/killall evsieve

    multi_mouse_exists=$(ls -a | grep -c $vmm | sort -u)
    log "Checking if symlink exits..."	
	
    if [[ $multi_mouse_exists == "1" ]]
    then
        log "Removing symbolic link"
        rm $vmm
    fi
 
    sleep $delay
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

event_mouse=( $(ls -a | grep mouse) )

# init_input arg array
args=()

log "Locating all relative mouse types"
log "Includes trackball, mouse and spinner"

#abs usb devices are not yet implemented
for mouse_name in "${event_mouse[@]}"
do
    rel=$(/usr/bin/udevadm info -q property ${dest}${mouse_name}* | grep -ic "id_input_mouse=1")
    if [[ $rel == "1" ]]
    then
        args+=("${input} ${dest}${mouse_name}")
    else
        log "abs ${mouse_name} is not supported at this time"
    fi
done
args+=("${output} ${name}${vmm} ${create}${dest}${vmm}")

log "Creating our Virtual Multi-Mouse"
evs=$(evsieve ${args[@]}) &
log $evs

log "Evsieve Started..."

$sys$scr$mmsh pregame Get Ready Player One!

# The watcher starts here:
log "Starting the USB watcher..."

hot=$(ls -a | grep usb)
swp=$hot

log "Monitor physical event-mouse devices"
while [[ $hot == $swp ]]
do
    sleep 5
    swp=$(ls -a | grep usb)
done

log "Cleaning up our mess"
destroy
cobra=$(kill -9 $!)
log $cobra
log "Restarting Virtual Multi-Mouse..."
$sys$script start