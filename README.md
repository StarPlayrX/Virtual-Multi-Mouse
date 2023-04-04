# 🐭👾🖲️ Virtual Multi-Mouse 1.1.0 🖲️👾🐭

The best auto-config solution on the planet for combining your spinner, trackball, mouse into one virtual mouse! Written from the ground up with hightly intelligent code.

## 🐭👾🖲️ Get Ready Player One!

Virtual Multi-Mouse auto configures trackball, spinner, mouse into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on v35, v36 and v37. Official lightgun support is coming soon!

Like Batocera, it's made to just play! Need to change your mouse configuration? Within a flash VMM sets up the virtual mouse accordingly. All you need to do is reboot and run a game! The software automatically determines the proper mouse config for player 1 games.

Virtual Multi-Mouse uses sophisticated central intelligance gathering. VMM is programmed to be smart, very smart. Upon every fresh reboot, it does a great job reconfiguring all your mouse devices. This software aims to be a zero-config-solution. We want VMM to be Auto-Magic!

Troubleshooting: If things are not working, try exiting your game and relaunching it. Sometimes VMM needs a jump start. If your mouse controllers are still not working, simply reboot Batocera. Still having trouble? Feel free to post an issue.

Beginning with 1.0.10, at install Batocera.conf is set to be backed up. This is safegard incase something happens to this file. Virtual Multi-Mouse sets the global index here for EmulationStation and RetroArch to configure.

Virtual Multi-Mouse natively supports relative usb devices this includes mouse, trackballs and spinners. We currently do not support absolute devices which are trackpads, lightguns and touch screens. These are absolute devices. Starting with 1.1.1 be adding official support for known abs devices. We plan to include a configuration file that allows the user to determine which types of devices they want combined, and this may include further ways to manage games such as, I want X.zip to have Y.gun, etc, without needing to know its complex name or wavering index. The global config will be something like mouse=1, lightgun=1, touchpad=0. and we may have separate assignments for gun games, spinner games and trackball games in the near future, depending on what game data we can collect autmatically.

Known issue: There is a slow down when combining absolute Apple Magic Trackpads with relative mice. For now absolute devices are turned off. Version 1.1.1 will introduce a mm.conf file that will allow which types of devices are combined and possibly more granular control without makes things too complex. 

Virtual Multi-Mouse reviews all mouse indices upon startup. This includes its own index, all relative devices, all absolute devices.

When a game starts, Batocera inserts evmapy to the next avaiable usb slot. This usually gets added at the end, but if you remove any usb device, evampy on the next game will consume that space. VMM is now smart enough to deal with this chaos. While we still encourage leaving your usb devices alone while running Batoceara, VMM is getting smarter by the day and is able to take on these new challenges.

Each version gets better and better!

## 🐭👾🖲️ Ready to Enter the Multi-Verse?

0.  If you have smb// working, you can copy files over instead of sneaker net, curl this repo works also
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

## 🐭👾🖲️ Manual install instructions coming soon.
0. Until here is a brief summary
1. mm.sh goes in /userdata/system/scripts/ needs `chmod +x` or `755` rights
2. multimouse.sh and custom.sh goes in /userdata/system/ needs `chmod +x` or `755` rights
3. go to terminal, `cd /userdata/system`
4. `./custom.sh` start
5  or `reboot`

## 🐭👾🖲️ Want to Leave the Multi-Verse?

1.  Insert the thumb drive to your Batocera Linux box
2.  Type `F1` to enter File Manager
3.  Navigate to /Applications and open Xterm
4.  `cd /media/install/MM`
5.  `./install.sh -uninstall`
6.  `reboot`

## 🐭👾🖲️ Credits
* Virtual Multi-Mouse developed by StarPlayrX aka Todd Bruss
* KarsMulder for writing Evsieve, simply amazing work
* Special thanks to the Batocera team for giving me a renewed interest in Linux
* Shout out to RetroArch, EmulationStation, Recalbox and MAME teams

## 🐭👾🖲️ Reference Material

* https://github.com/KarsMulder/evsieve
* https://wiki.batocera.org/launch_a_script
* https://forums.libretro.com/t/configuring-ra-for-multi-mouse-spinners-lightguns-tackballs/12619E
* https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/27

## 🐭👾🖲️ Coming Soon
* Pacman package manager packages.
