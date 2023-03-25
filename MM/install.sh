#!/bin/bash

#
#  install.sh
#
#  Multi-Mouse
#
#  MM 1.0.3
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
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
		echo making script directory
        mkdir $dir$scripts
		echo removing previous files
        rm -f $dir$custom
        rm -f $dir$start
        rm -f $dir$stop
		rm -f $dir$scripts$first
		echo copying files
        cp ./$custom $dir$custom
        cp ./$start $dir$start
        cp ./$stop $dir$stop
        cp ./$first $dir$scripts$first
		echo updating permissions
		chmod 755 $dir$custom
		chmod 755 $dir$start
		chmod 755 $dir$stop
		chmod 755 $dir$scripts$first
		echo install complete
        ;;
    -uninstall)
		echo uninstalling files
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
