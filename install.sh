#!/bin/bash

#  install.sh
#  Multi-Mouse installer script
#
#  Created by StarPlayrX | Todd Bruss on 3/24/23.
#  

# remove previous if they exist

dir="/userdata/system/"
scripts='/scripts/'
custom='custom.sh'
first='first_script.sh'
start='multi_mouse_start.sh'
stop='multi_mouse_stop.sh'

case "$1" in
    -install)
        # install
        mdir $dir$scripts
        rm $dir$custom
        rm $dir$start
        rm $dir$stop
        cp ./$custom $dir$custom
        cp ./$start $dir$start
        cp ./$stop $dir$stop
        cp ./$first $dir$scripts$first
        ;;
    -uninstall)
        # uninstall
        rm $dir$custom
        rm $dir$start
        rm $dir$stop
        ;;
    -restart)
        reboot
        ;;
      *)
        echo "Usage: $0 {-install|-uninstall|-restart}"
      ;;
esac
