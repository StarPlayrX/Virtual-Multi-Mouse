#!/bin/bash
# Code here will be executed on every boot and shutdown.
 
dir="/userdata/system/"
init="multi_mouse_start.sh"
stop="multi_mouse_stop.sh"

case "$1" in
    start)
        echo starting multi-mouse
        ($dir$init) &
        ;;
    stop)
        echo stopping multi-mouse
        $dir$stop
		;;
    restart)
		echo machine is restarting
        echo stopping multi-mouse
        $dir$stop
        ;;
	reload)
		echo machine is reloading
        echo reloading multi-mouse
        $dir$stop
        ;;
      *)
        echo "Usage: $0  start  stop  restart  reload"
      ;;
esac
 
exit $?
