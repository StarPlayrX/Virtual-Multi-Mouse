#!/bin/bash

#
#  custom.sh
#
#  Virtual  
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.26
#

version='1.0.6'

dir='/userdata/system/'
scripts='scripts/'
mm='multimouse.sh'
mmgs='mm.sh'
mmlog='mm.log'
multimouselog='multimouse.log'
mmcustomlog='mm_custom.log'
logs='/logs/'
start='start'
stop='stop'
delay=2
rm -f $dir$logs$mmcustomlog

log() {
 (echo "${1}" | ts) >> $dir$logs$mmcustomlog
}

log "======================================="
log "Multi-Mouse ${version} | ${0} | ${1}"
log "======================================="

case "$1" in
    start)
        log "${1}: Starting Multi-Mouse"
		
		log "Reseting previous logs"
		rm -f $dir$logs$mmlog
		rm -f $dir$logs$multimouselog

		log "Sleeping for ${delay} seconds..."
		sleep $delay

		log "Startup retroarch.log ahead of time"
		$dir$scripts$mmgs init

		log "Sleeping for ${delay} seconds..."
		sleep $delay

		log "Gentleman start your engines!"
        ($dir$mm $start) &
     
    ;;
    stop)
        log "${1}: Stopping Multi-Mouse"
        #($dir$mm $stop) &
	;;
    restart)
		log "${1}: Restarting Multi-Mouse"
    	# check if we can do soft reboot using F4 in the gui
		#($dir$mm $stop) &
    ;;
    reload)
		log "${1}: Reloading Multi-Mouse"
        #($dir$mm $start) &
    ;;
      *)
        log "${0} No matching arguments: ${1}"
        echo ""
        echo "Usage: ${0}  start  stop  restart  reload"
        echo ""
   ;;
esac
 
exit $?
