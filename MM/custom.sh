#!/bin/bash

#
#  custom.sh
#
#  Multi-Mouse
#
#  MM 1.0.4
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

dir='/userdata/system/'
mm='multimouse.sh'
mmlog='/logs/mm_custom.log'
start='start'
stop='stop'

log() {
 (echo "${1}" | ts) >> $userdata$dir$mmlog
}

(echo "Welcome to Multi Mouse 1.0.4 custom.sh" | ts) > $userdata$dir$mmlog
  log "======================================"

case "$1" in
    start)
        log "${1}: Starting Multi-Mouse"
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
        echo "Usage: ${0}  start  stop  restart  reload"
        ;;
esac
 
exit $?
