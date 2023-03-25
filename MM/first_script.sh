#!/bin/bash

#
#  first_script.sh
#
#  Multi-Mouse
#
#  MM 1.0.3
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

# reference
# https://wiki.batocera.org/launch_a_script

#!/bin/bash

# variables
mouse='01A_Multi_Mouse'
dir='/userdata/system/logs/'
log='retroarch.log'
cmd='batocera-settings-set'
input='global.retroarch.input_player1_mouse_index'
err='Error: mouse not found'
ext='Error: could not extract mouse index from log file'
mmlog='/tmp/multi_mouse.log'

# enable log file
echo enabling log file
$cmd global.retroarch.log_dir $dir
$cmd global.retroarch.log_to_file true
$cmd global.retroarch.log_to_file_timestamp false

# do this on a delay (let's retroarch start first)
sleep 1

echo extracting index
# extract mouse index from log file
mouse_str=$(awk -F'[:"]' -v name="${mouse}" '/Mouse #/ && $4==name {print $2; found=1} END{if (!found) echo err}' "${dir}${log}")

index=$(echo $mouse_str | awk -F'#' '{print $2}')

echo check if mouse index is found
if [ -n "${index}" ]
then
    echo "multi-mouse success: ${cmd} ${input} ${index}" >> $mmlog
	echo $cmd $input $index
    $cmd $input $index
else
    echo "${err}" >> $mmlog
    exit 1
fi

# Case selection for first parameter parsed, our event.
case $1 in
    gameStart)
        echo Commands in here will be executed on the start of any game.
        echo "Game Start" > $mmlog
        echo "$@" >> $mmlog
        echo "Multi Mouse found on index: ${index}" >> $mmlog
    ;;
    gameStop)
        echo Commands here will be executed on the stop of every game.
        echo "Game End" >> $mmlog
        echo "Multi Mouse found on index: ${index}" >> $mmlog
    ;;
	*) 
		echo Usage $0  gameStart  gameStop
	;;
esac
