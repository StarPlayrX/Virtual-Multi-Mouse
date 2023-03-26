#!/bin/bash

#
#  mm.sh
#
#  Multi-Mouse
#
#  MM 1.0.4
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#

# reference
# https://wiki.batocera.org/launch_a_script

#!/bin/bash

# variables
mouse='ZZ_Multi_Mouse_MM'
logfile="retroarch.log"
dir='/userdata/system/logs/'
logfile='retroarch.log'
cmd='batocera-settings-set'
input='global.retroarch.input_player1_mouse_index'
err='Error: mouse not found'
mmlog='mm.log'
log() {
 (echo "${1}" | ts) >> $userdata$dir$mmlog
}

(echo "Welcome to Multi Mouse 1.0.4 mm.sh" | ts) > $userdata$dir$mmlog
  log "=================================="

log "Enabling retroarch log file"
$cmd global.retroarch.log_dir $dir
$cmd global.retroarch.log_to_file true
$cmd global.retroarch.log_to_file_timestamp false

log "Extract mouse index from log file"
mouse_str=$(awk -F'[:"]' -v name="${mouse}" '/Mouse #/ && $4==name {print $2; found=1} END{if (!found) echo notfound}' "${dir}${logfile}")

log "* mouse: ${mouse_str}"
index=$(echo $mouse_str | awk -F'#' '{print $2}')

log "index: ${index}"
log "check if mouse index is found"

if [ -n "${index}" ]
then
    log "Multi-Mouse success: ${cmd} ${input} ${index}"
    log "${cmd} ${input} ${index}"
    $cmd $input $index
else

    log "Mouse not found"
    log "${err}"
    exit 1
fi

log "${@} $@ script: ${0} arguments: ${1}"

log "Note: gameStart never gets called on v35"

case $1 in
    gameStart)
        log "Game Start"
        log "$@"
        echo "Multi Mouse found on index: ${index}"
    ;;
    gameStop)
        log "Game End"
	log "$@"
        log "Multi Mouse found on index: ${index}"
    ;;
    *) 
	echo Usage $0  gameStart  gameStop
    ;;
esac
