#!/bin/bash

#
#  multi_mouse_stop.sh
#
#  Multi Mouse v1.0.2
#  stop script
#
#  Created by StarPlayrX / Todd Bruss on 2023/03/23
#  GNU General Public License, Free for anyone to use
#  Zero Config, no adjustments to this script are necessary
#
#  Tested on Batocera v35
#

# variables
dest='/dev/input/by-id/'
mm='01A_Multi_Mouse'

# change to dev input by-id dir
cd /${dest}

#check if multi mouse is running
multi_mouse_exists=$(ls -a | grep -c $mm)

if [ $multi_mouse_exists == "1" ]
then
	rm $mm
fi
