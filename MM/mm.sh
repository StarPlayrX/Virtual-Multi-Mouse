#!/bin/sh

#
#  mm.sh
#
#  Virtual
#  Multi-Mouse
#
#  Created by StarPlayrX | Todd Bruss on 2023.03.25
#
# Reference
# https://wiki.batocera.org/launch_a_script

mouse='Virtual_Multi_Mouse'
logfile="retroarch.log"
dir='/userdata/system/logs/'
logfile='retroarch.log'
cmd='batocera-settings-set'
input='global.retroarch.input_player1_mouse_index'
err='Error: mouse not found'
mmlog='mm.log'
delay=0.666

log() {
    (echo "${1}" | ts) >> $userdata$dir$mmlog
}

log "======================================================================================="
log "Multi-Mouse ${6} | ${0} | ${1}"
log "Platform: ${2}"
log " Library: ${3}"
log "  Engine: ${4}"
log "     ROM: ${5}"               
log "======================================================================================="

preflight() {
	#to do weed out un-needded vars
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

seek() {
    mouse_str=$(awk -F'[:"]' -v name="${mouse}" '/Mouse #/ && $4==name {print $2}' "${dir}${logfile}")
    index=$(echo $mouse_str | awk -F'#' '{print $2}')
}

enable() {
    log "Enabling Retroarch Postflight log file..."
    $cmd global.retroarch.log_dir $dir
    $cmd global.retroarch.log_to_file true
    $cmd global.retroarch.log_to_file_timestamp false
}

update() {
    if [ -n "${index}" ]
    then
        log "Multi-Mouse success: ${cmd} ${input} ${index}"
        $cmd $input $index
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
	    preflight
    ;;
    *)
    echo ""
    echo Usage $0  gameStart  gameStop  init  prep
    echo ""
    ;;
esac
