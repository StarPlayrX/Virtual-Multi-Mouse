# Multi-Mouse
Auto configures Trackball, Spinner, Mouse, Trackpad into only device for Batocera with RetroArch

**Introducing Multi Mouse**
MM is the  auto-magic solution for combining multiple mouse inputs into a single virtual device.

**Features**
Supports any number of event mice 2 or more!
Combines spinner, trackball, mouse, trackpad, and other pointing devices.

**Ready Player One**
No hard encoded, hard to type, a pain to copy event-mouse names, MM hunts them down for you
No editing after you swap out new mouse devices
No guessing to what the multi-mouse index should be and no log scraping
No need to configure mouse inputs for a single 1 player game ever

**Details**
Like Batocera, it's plug and play
Add or remove a usb mouse, trackball or spinner? Simply reboot
Runs in the background using a sub shell
Updated to work with MisterB's first_script.sh

**News**
Designed to work with Mister B's first_script.sh
https://github.com/StarPlayrX/Multi-Mouse

**Directions**
Copy custom.sh script to an ExFat partition and attach it to your Batocera machine.
`press F1`
Copy and Paste this script directly inside your /userdata/system/ folder
`press F4`

**type**
`ls -a`
`chmod 755 ./custom.sh`
`reboot`
