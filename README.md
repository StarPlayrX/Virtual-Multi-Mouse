# 🐭👾🖲️ Virtual Multi-Mouse 1.0.7 🖲️👾🐭

The best auto-config solution for combining your spinner, trackball, mouse and lightguns into one virtual mouse! Written from the ground up. Ready to dive in for some golden age Arcade gaming?

## 🐭👾🖲️ Get Ready Player One!

Auto configures trackball, spinner, mouse, lightgun into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on v36.

MM is the magic solution for combining multiple mouse inputs into a single virtual device. Supports any combination of spinners trackball, mouse or trackpads. We made Multi-Mouse so you can just play. Requires no editing. MM is designed to configure itself as one device.

Get ready player one. No hard encoded, hard to type event-mouse names. MM will hunt them down for you making the setup ultra easy. There's no editing after you swap out new mouse, trackball or spinner. No need to configure the mouse input for a single 1 player game.
 
Like Batocera it's plug and play. Need to change your hardware configuration? Multi-Mouse intelligently preflights the games you play and sets up the virtual mouse accordingly. Simply run a game? Having trouble, exit and try? Worst case, scenario reboot.

Removed Apple Magic Trackpads from the Virtual Multi-Mouse. This device slows down Spinners and Trackballs considerably. If you need to use it, let me know, I can advise and edit.

## 🐭👾🖲️ Ready to Enter the Multi-Verse?

1.  Insert a thumb drive to a Mac or PC
2.  Format it using ExFat, name the disk `install`
3.  Copy the `MM folder` to the thumb drive
4.  Insert the thumb drive to your Batocera Linux box
5.  Type `F1` to enter File Manager
6.  Navigate to /Applications and open Xterm
7.  `cd /media/install/MM`
8.  `chmod 755 ./install.sh` #may not be needed
9.  `./install.sh -install`
10.  `reboot`
11.  or try
12.  `cd /userdata/system`
13.  `./custom.sh start`
14.  `exit`
15.  `control-Q`
16.  Enjoy your new multi-mouse!

## 🐭👾🖲️ Credits

* Virtual Multi-Mouse develped by StarPlayrX aka Todd Bruss
* KarsMulder for writing Evsieve
* MizterB for his post on the subject
* Special thanks to the Batocera team for giving me a renewed interest in Linux
* Shout out to RetroArch, EmulationStation, Recalbox and Multiple Machine Arcade Emulator teams

## 🐭👾🖲️ Reference Material

* https://github.com/KarsMulder/evsieve
* https://wiki.batocera.org/launch_a_script
* https://forums.libretro.com/t/configuring-ra-for-multi-mouse-spinners-lightguns-tackballs/12619E
* https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/8
* https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/10

## 🐭👾🖲️ Coming Soon

* Ports to other versions of Linux that support udev input driver, Evsieve, EmulationStation and RetroArch
