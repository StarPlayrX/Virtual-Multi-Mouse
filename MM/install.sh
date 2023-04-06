#!/bin/bash

#
#  install.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.04.06
#

# todo: Add logging to the installer
# todo: Create a package instead of an installer

version='1.1.2'

dir="/userdata/system/"
scripts='scripts/'

# current batch
mm="mm.sh"
multi="multimouse.sh"
custom='custom.sh'
bat='batocera.conf'
backup='batocera_backup.conf'

echo
echo "Welcome to Virtual Multi-Mouse ${version}"
echo

case "$1" in
    -install)
        echo install
		echo making script directory

        mkdir $dir$scripts

		echo removing previous files
        rm -f $dir$custom
		rm -f $dir$multi
		rm -f $dir$scripts$mm
        rm -f $dir$backup
		
        echo copying files
        cp ./$custom $dir$custom
        cp ./$multi $dir$multi
        cp ./$mm $dir$scripts$mm
        
        #Backup batocera.conf
        cp $dir$bat $dir$backup

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
        rm -f $dir$backup

		echo uninstall complete
        ;;
    -restart)
		echo restarting...
        reboot
        ;;
      *)
		echo ""
        echo "Usage: $0  -install  -uninstall  -restart"
		echo ""
      ;;
esac
