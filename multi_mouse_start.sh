#!/bin/bash

#
#  multi_mouse_start.sh
#
#  Multi Mouse v1.0.2
#  Auto Config
#
#  Created by StarPlayrX / Todd Bruss on 2023/03/23
#  GNU General Public License, Free for anyone to use
#  Zero Config, no adjustments to this script are necessary
#

# variables
script='custom.sh'
input='--input'
dest='/dev/input/by-id/'
userdata='/userdata/system/'
output='--output'
mm='01A_Multi_Mouse'
name='name='
create='create-link='
dir='/logs/'
log='retroarch.log'
delay=10

# change to dev input by-id dir
cd /${dest}

#check if multi mouse is running
multi_mouse_exists=$(ls -a | grep -c $mm)

if [ $multi_mouse_exists == "1" ]
then
	rm $mm
	sleep 5
fi
 
# count event_mouse instances, this becomes our multi_mouse_index
mi=$(ls -a | grep -c mouse)

# set retroarch player one global index to our new multi mouse
batocera-settings-set global.retroarch.input_player1_mouse_index $mmi

# update log
echo "[INFO] [udev]: Mouse #${mi}: "${mm}" (REL) /dev/input/eventMM" > $userdata$dir$log

# gather all event mouse names
event_mouse=( $(ls -a | grep mouse) )

# init_input arg array
args=()

# create input args
for ev in "${event_mouse[@]}"
do
	args+=("${input} ${dest}${ev}")
done

# add output arg
args+=("${output} ${name}${mm} ${create}${dest}${mm}")

# create our multi mouse
evsieve ${args[@]}

echo "evsieve exited, Restarting in ${delay} seconds"
# if evsieve exits, run it again after ${delay} seconds
sleep $delay
echo "Restarting Multi Mouse..."

#rerun the script
$userdata$script
