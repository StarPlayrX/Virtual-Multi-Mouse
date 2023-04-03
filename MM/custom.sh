#!/bin/bash

#
#  custom.sh
#
#  Virtual  
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.04.01
#

version='1.0.10'

dir='/userdata/system/'
mm='multimouse.sh'
mmsh='mm.sh'
mm_log='mm.log'
multimouse_log='multimouse.log'
mmcustom_log='mm_custom.log'

logs='logs/'
start='start'
stop='stop'

rm -f $dir$logs$mmcustom_log

ts() {
    date +"%T"
}

log() {
    (echo "$(ts) ${1}") >> $dir$logs$mmcustom_log
}

log "======================================================"
log "VMM ${version} | ${0} | ${1}"
log "======================================================"

case "$1" in
    start)
        log "${1}: Starting Multi-Mouse"
		
	log "Reseting previous logs"
	rm -f $dir$logs$mm_log
	rm -f $dir$logs$multimouse_log

	log "Entering the Multi-Verse"
        ($dir$mm $start $version) &
    ;;
    stop)
        log "${1}: Exiting the Multi-Verse"
        ($dir$mm $stop $version) &
    ;;
      *)
        log "${0} No matching arguments: ${1}"
        echo
	echo "Usage: ${0}  start  stop"
	echo
   ;;
esac
 
exit $?
