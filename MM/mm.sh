#!/bin/bash

#
#  mm.sh
#
#  Virtual
#  Multi-

#
#  Created by StarPlayrX | Todd Bruss on 2023.03.30
#
# Reference
# https://wiki.batocera.org/launch_a_script

vmm='Virtual_Multi_Mouse'
logfile="retroarch.log"
dir='/userdata/system/logs/'
logfile='retroarch.log'
cmd='batocera-settings-set'
input='global.retroarch.input_player1_mouse_index'
err='Error: mouse not found'
mmlog='mm.log'
delay='0.666'

log() {
    (echo "${1}" | ts) >> $userdata$dir$mmlog
}

log "==========================================================================="
log "Multi-Mouse ${6} | ${0} | ${1}"
log "Platform: ${2}"
log " Library: ${3}"
log "  Engine: ${4}"
log "     ROM: ${5}"               
log "==========================================================================="

preflight() {
    #to do weed out un-needed vars
    XDG_CONFIG_HOME='/userdata/system/configs'
    LANGUAGE=''
    CONSOLE='/dev/console'
    SHLVL='1'
    HOME='/userdata/system'
    OLDPWD='/userdata'
    DBUS_SESSION_BUS_ADDRESS='unix:path=/tmp/dbus-BBNN0Yzzch,guid=96cf0951e936252a52d4c1736424feaa'
    INIT_VERSION='sysvinit-'
     _='/usr/bin/emulationstation'
    label='PREFLIGHT'
    TERM='linux'
    WINDOWPATH='2'
    BOOT_IMAGE='/boot/linux'
    PATH='/sbin:/usr/sbin:/bin:/usr/bin'
    RUNLEVEL='S'
    XDG_RUNTIME_DIR='/var/run'
    DISPLAY=':0'
    PREVLEVEL='N'
    LANG='en_US.UTF-8'
    SHELL='/bin/sh'
    PWD='/userdata'
    LC_ALL='en_US.UTF-8'
    SDL_RENDER_VSYNC='1'

    /usr/bin/retroarch -L "/usr/lib/${4}/${3}_${4}.so" \ 
    --log-file=/userdata/system/logs/retroarch.log \ 
    --config=/userdata/system/configs/retroarch/retroarchcustom.cfg \
    --set-shader /usr/share/batocera/shaders/interpolation/sharp-bilinear-simple.slangp --verbose $5 &

	sleep $delay
    	kill -9 $!
}

pregame() {
    DISPLAY=':0'

    /usr/bin/retroarch -verbose --log-file=/userdata/system/logs/retroarch.log \
    --config=/userdata/system/configs/retroarch/retroarchcustom.cfg &
    
    sleep $delay
    kill -9 $!
}

seek() {
    log "Virtual Mouse index finder by MizterB"
    vmm_idx=$(sed -En "s~.*Mouse #(.*): \"$vmm\".*~\1~p" ${dir}${logfile} | tail -1) ## tail because new VMM's usually are at the end
    log "looking for index: ${vmm_idx}"
}

enable() {
    log "Enabling Retroarch Postflight log file..."
    $cmd global.retroarch.log_dir $dir
    $cmd global.retroarch.log_to_file true
    $cmd global.retroarch.log_to_file_timestamp false
}

update() {
    if [ -n "${vmm_idx}" ]
    then
	#picks first word when 0 mouse mystery"
	mightymouse=${vmm_idx%% *}
        $cmd $input $mightymouse
	log "Success: ${cmd} ${input} ${mightymouse}"
    else
	log "Failure: No virtual mouse found :( ${vmm_idex} ${mightymouse}"
    fi
}

case $1 in
    gameStart)
	    preflight
	    seek
	    update
    ;;
    gameStop)
	    seek
	    update
    ;;
    init)
	    enable
    ;;
    prep)
	    pregame
    ;;
    *)
    echo ""
    echo "Usage  ${1}  gameStart  gameStop  init  prep"
    echo ""
    ;;
esac
