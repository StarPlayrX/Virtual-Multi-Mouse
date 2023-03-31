#!/bin/bash

#
#  custom.sh
#
#  Virtual  
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.30
#

version='1.0.8'

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
delay=1
rm -f $dir$logs$mmcustomlog

log() {
    (echo "${1}" | ts) >> $dir$logs$mmcustomlog
}

log "======================================================"
log "Multi-Mouse ${version} | ${0} | ${1}"
log "======================================================"

case "$1" in
    start)
        log "${1}: Starting Multi-Mouse"
		
		log "Reseting previous logs"
		rm -f $dir$logs$mmlog
		rm -f $dir$logs$multimouselog
	
		log "Let the system finish booting up..."
		sleep $delay
	
		$dir$scripts$mmgs init Welcome to the Jungle $version

		log "Gentleman start your engines!"
        ($dir$mm $start $version) &
    ;;
    stop)
        log "${1}: Stopping Multi-Mouse"
        ($dir$mm $stop $version) &
    ;;
      *)
        log "${0} No matching arguments: ${1}"
        echo ""
	echo "Usage: ${0}  start  stop"
   ;;
esac
 
exit $?
