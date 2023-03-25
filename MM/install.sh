#!/bin/bash

#
#  install.sh
#  Multi-Mouse installer script
#
#  Created by StarPlayrX | Todd Bruss on 3/24/23.
#  

dir="/userdata/system/"
scripts='scripts/'
custom='custom.sh'
first='first_script.sh'
start='multi_mouse_start.sh'
stop='multi_mouse_stop.sh'

case "$1" in
    -install)
        echo install
        mkdir $dir$scripts
        rm -f $dir$custom
        rm -f $dir$start
        rm -f $dir$stop
		rm -f $dir$scripts$first
        cp ./$custom $dir$custom
        cp ./$start $dir$start
        cp ./$stop $dir$stop
        cp ./$first $dir$scripts$first
		echo install complete
        ;;
    -uninstall)
		echo uninstall
        rm $dir$custom
        rm $dir$start
        rm $dir$stop
		rm $dir$scripts$first
		echo uninstall complete
        ;;
    -restart)
		echo reboot
        reboot
        ;;
      *)
		echo ""
        echo "Usage: $0  -install  -uninstall  -restart"
		echo ""
      ;;
esac
