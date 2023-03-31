# 🐭👾🖲️ Virtual Multi-Mouse 1.0.8 🖲️👾🐭

The best auto-config solution for combining your spinner, trackball, mouse and lightguns into one virtual mouse! Written from the ground up. Ready to dive in for some golden age Arcade gaming?

## 🐭👾🖲️ Get Ready Player One!

Auto configures trackball, spinner, mouse, lightgun into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on v36.

Like Batocera it's made to just play! Need to change your mouse configuration? Multi-Mouse intelligently preflights the games you play ahead of time. Within a flash it sets up the virtual mouse accordingly. All you need to do is run a game!

Known issue: The Apple Magic Trackpad by default has been removed from Virtual Multi-Mouse. This Trackpad slows down and Spinner and Trackball setup. If you need to use it, you can simply comment out the 'Apple' variable in multimouse.sh.

Virtual Multi-Mouse preflights your games ahead of time and tries to make sure everyhing is up to snuff before your game runs. Everything it does it tries it's best to about a smarter way of doing things. More intellience is being added to each release. This takes time to get it right and thanks for your patience to those who are testing VMM now! Our software aims to be zero or auto-config! We want VMM to be Auto-Magic!

Troubleshooting: If things are not working, try exiting your game and relaunching it. This usually should not be needed but that sometimes gives VMM a jump start. If your mouse controllers are still not working, reboot Batocera. Worst case, try backing up and removing the Batocera.conf file. We are aware sometimes this file gets corrupted. We will start backing the config up in the next release and retain a clean copy from the latest Batocera release just in case. In the mean time, it is a good idea to backup your batocera.conf file.

## 🐭👾🖲️ Ready to Enter the Multi-Verse?

1.  Insert a thumb drive to a Mac or PC
2.  Format it using ExFat, name the disk `install`
3.  Copy the `MM folder` to the thumb drive
4.  Insert the thumb drive to your Batocera Linux box
5.  Type `F1` to enter File Manager
6.  Navigate to /Applications and open Xterm
7.  `cd /media/install/MM`
8.  `chmod 755 install.sh` #may not be needed
9.  `./install.sh -install`
10.  `reboot`
11.  or try install of rebooting
12.  `cd /userdata/system`
13.  `./custom.sh start`
14.  `exit`
15.  `control-Q`
16.  Enjoy your new multi-mouse!

## 🐭👾🖲️ Want to Leave the Multi-Verse?

1.  Insert the thumb drive to your Batocera Linux box
2.  Type `F1` to enter File Manager
3.  Navigate to /Applications and open Xterm
4.  `cd /media/install/MM`
5.  `./install.sh -uninstall`
6.  `reboot`
7.  No hard feelings, we understand Multi-Mouse is not for everyone.

## 🐭👾🖲️ Credits
* Virtual Multi-Mouse develped by StarPlayrX aka Todd Bruss
* KarsMulder for writing Evsieve, simply amazing work
* MizterB virtual mouse index finder line and batocera to retroarch logging
* Special thanks to the Batocera team for giving me a renewed interest in Linux
* Shout out to RetroArch, EmulationStation, Recalbox and MAME teams

## 🐭👾🖲️ Reference Material

* https://github.com/KarsMulder/evsieve
* https://wiki.batocera.org/launch_a_script
* https://forums.libretro.com/t/configuring-ra-for-multi-mouse-spinners-lightguns-tackballs/12619E
* https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/8
* https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/10

## 🐭👾🖲️ Coming Soon

* Ports to other versions of Linux that support udev input driver, Evsieve, EmulationStation and RetroArch
* Pacman package manager packages.
