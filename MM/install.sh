#!/bin/bash

#
#  install.sh
#
#  Multi-Mouse
#
#  MM 1.0.5
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

# todo: Add logging to the installer

dir="/userdata/system/"
scripts='scripts/'

# deprecated
first='first_script.sh'
start='multi_mouse_start.sh'
stop='multi_mouse_stop.sh'
swap='multi_mouse_watch.sh'

# current batch
mm="mm.sh"
multi="multimouse.sh"
custom='custom.sh'

case "$1" in
    -install)
        echo install
		echo making script directory

        mkdir $dir$scripts

		echo removing previous files
        rm -f $dir$custom
		rm -f $dir$multi
		rm -f $dir$scripts$mm
	
        rm -f $dir$start #deprecated
        rm -f $dir$stop #deprecated
        rm -f $dir$swap #deprecated	
		rm -f $dir$scripts$first #deprecated

		echo copying files

        cp ./$custom $dir$custom
        cp ./$multi $dir$multi
        cp ./$mm $dir$scripts$mm

		echo updating permissions

		chmod 755 $dir$custom
		chmod 755 $dir$multi
		chmod 755 $dir$scripts$mm

		echo install complete
        ;;
    -uninstall)
		echo uninstalling files
        rm -f $dir$custom
		rm -f $dir$multi
		rm -f $dir$scripts$mm
	
        rm -f $dir$start #deprecated
        rm -f $dir$stop #deprecated
        rm -f $dir$swap #deprecated	
		rm -f $dir$scripts$first #deprecated

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
