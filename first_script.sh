#!/bin/bash

#  first_script.sh
#  log reader added on for multi_mouse.sh
#
#  Updated to work with Multi Mouse 1.0.2 by StarPlayrX on 2023.03.24
#

# On Batocera v35 or later place first_script.sh in:
# /userdata/system/scripts/
# you will have to create /scripts directories manually
# an installer script is coming soon to make this much easier
# press [F1] to open file manager gui on Batocera
# press [F4] to open terminal on Batocera
# cd /userdata/system/scripts/
# mkdir scripts
# cd scripts
# exit
# copy first_script.sh to /scripts folder
# [F4] to enter terminal again
# chmod ./first_script.sh
# reboot

# see
# https://wiki.batocera.org/launch_a_script

#!/bin/bash

# variables
mouse_name='01A_Multi_Mouse'
dir='/userdata/system/logs/'
log='retroarch.log'
cmd='batocera-settings-set'
input='global.retroarch.input_player1_index'
err='Error: mouse not found'
ext='Error: could not extract mouse index from log file'
mmlog='/tmp/multi_mouse.log'

# enable log file
$cmd global.retroarch.dir $dir
$cmd global.retroarch.log_to_file true
$cmd global.retroarch.log_to_file_timestamp false

# extract mouse index from log file
index=$(awk -F'[:"]' -v name="${mouse_name}" '/Mouse #/ && $4==name {print $2; found=1} END{if (!found) exit 1}' "${dir}${log}")

# check if we can extract the mouse index from the file
if [ $? -ne 0 ]
then
    echo "${ext}" >> $mmlog
    exit 1
fi

# check if mouse index is found
if [ -n "${index}" ]
then
    echo "multi-mouse success: ${cmd} ${input} ${index}" >> $mmlog
    $cmd $input $index
else
    echo "${err}" >> $mmlog
    exit 1
fi


# Case selection for first parameter parsed, our event.
case $1 in
    gameStart)
        # Commands in here will be executed on the start of any game.
        echo "Game Start" > $mmlog
        echo "$@" >> $mmlog
        echo "Multi Mouse found on index: ${index}" >> $mmlog
    ;;
    gameStop)
        # Commands here will be executed on the stop of every game.
        echo "Game End" >> $mmlog
        echo "Multi Mouse found on index: ${index}" >> $mmlog
    ;;
esac

