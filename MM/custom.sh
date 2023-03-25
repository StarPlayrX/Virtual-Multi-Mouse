#!/bin/bash

#
#  custom.sh
#
#  Multi-Mouse
#
#  MM 1.0.3
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

 
dir="/userdata/system/"
init="multi_mouse_start.sh"
stop="multi_mouse_stop.sh"

case "$1" in
    start|reload)
        echo starting multi-mouse
        ($dir$init) &
        ;;
    stop|restart)
        echo stopping multi-mouse
        $dir$stop
		;;
      *)
        echo "Usage: $0  start  stop  restart  reload"
      ;;
esac
 
exit $?
