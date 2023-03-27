#!/bin/bash

#
#  install.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.26
#

# todo: Add logging to the installer

version='1.0.6'

dir="/userdata/system/"
scripts='scripts/'

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
