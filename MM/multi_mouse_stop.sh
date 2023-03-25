#!/bin/bash

#
#  multi_mouse_stop.sh
#
#  Multi-Mouse
#
#  MM 1.0.3
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
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
