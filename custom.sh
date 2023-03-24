#!/bin/bash
# Code here will be executed on every boot and shutdown.
 
dir="/userdata/system/"
init="multi_mouse_start.sh"
stop="multi_mouse_stop.sh"

case "$1" in
    start)
        # at boot
        ($dir$init) &
        ;;
    stop|restart)
        # at shutdown
        $dir$stop
        ;;
    reload)
        # Code in here will executed (when?)
        echo reload
        ;;
      *)
        echo "Usage: $0 {start|stop|restart|reload}"
      ;;
esac
 
exit $?
