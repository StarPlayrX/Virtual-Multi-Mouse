# Multi-Mouse (MM) 🐭👾🖲️
## For Batocera v35 or later

**Root Folder**
/userdata/system/

**Script Name**
custom.sh

MM is the auto-magic solution for combining multiple mouse inputs into a single virtual device. Supports any number of event mice of 2 or more. Combines spinner, trackball, mouse, trackpad and other pointing devices. Requires no editing. Minimal installation. An installer script is coming soon!

Get Ready Player One!
No hard encoded, hard to type event-mouse names. MM will hunt them down for you.
No editing after you swap out new mouse devices.
No need to configure the mouse input for a single 1 player game.

Like Batocera, it's plug and play.
Add or remove a usb mouse, trackball or spinner?
Simply reboot or with MizterB's first_script.sh installed, Restart the game. Plus we've created a special version of first_script that's designed to work with MM.


**Instructions**

1. Copy custom.sh script to an ExFat partition and attach it to your Batocera machine.
`press F1 to enter the desktop gui`

2. Navigate to /userdata/system/. Copy and Paste this script directly inside the system folder
`press F4 to enter the terminal`


3. type

`ls -a`

`chmod 755 ./custom.sh`

`reboot`

4. See first_script.sh for optional mouse-index optmization
