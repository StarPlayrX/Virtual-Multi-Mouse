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
servicename='vmm'

echo
echo "Welcome to Virtual Multi-Mouse ${version}"
echo

batocera_services=/usr/bin/batocera-services
if [ -f "$batocera_services" ]
then
    echo "detected ${batocera_services}, using ${servicename} user service instead of ${custom}"
    customservice="${dir}services/${servicename}"
else
    customservice=$dir$custom
fi

case "$1" in
    -install)
        echo install
        echo making script directory

        mkdir $dir$scripts

        echo removing previous files
        rm -f $customservice
        grep Multi-Mouse $dir$custom && rm -f $dir$custom
        rm -f $dir$multi
        rm -f $dir$scripts$mm
        rm -f $dir$backup

        echo copying files
        cp ./$custom $customservice
        cp ./$multi $dir$multi
        cp ./$mm $dir$scripts$mm

        #Backup batocera.conf
        cp $dir$bat $dir$backup

        echo updating permissions
        chmod 755 $customservice
        chmod 755 $dir$multi
        chmod 755 $dir$scripts$mm

        if [ -f "$batocera_services" ]
        then
            echo "enabling and starting service"
            batocera-services enable "$servicename"
            batocera-services start "$servicename"
        fi

        echo install complete
        ;;
    -uninstall)
        if [ -f "$batocera_services" ]
        then
            echo "stopping and disabling service"
            batocera-services stop "$servicename"
            batocera-services disable "$servicename"
        fi

        echo uninstalling files
        rm -f $customservice
        grep Multi-Mouse $dir$custom && rm -f $dir$custom
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
