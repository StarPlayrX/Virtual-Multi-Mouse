#!/bin/bash

#
#  custom.sh
#
#  Multi Mouse v1.0.1
#  Auto Config
#
#  Created by StarPlayrX / Todd Bruss on 2023/03/23
#  GNU General Public License, Free for anyone to use
#  Zero Config, no adjustments to this script are necessary
#
#  Tested on Batocera v35
#
#  place this bash script in /userdata/system/
#  chmod 755 /userdata/system/custom.sh

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
