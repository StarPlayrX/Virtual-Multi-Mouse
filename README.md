# 🐭👾🖲️ Virtual Multi-Mouse 1.0.9 🖲️👾🐭

The best auto-config solution for combining your spinner, trackball, mouse and lightguns into one virtual mouse! Written from the ground up. RetroArch golden age arcade gaming on Batocera here we go!

## 🐭👾🖲️ Get Ready Player One!

Virtual Multi-Mouse auto configures trackball, spinner, mouse, lightgun into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on v35, v36 and v37.

Like Batocera it's made to just play! Need to change your mouse configuration? Within a flash it sets up the virtual mouse accordingly. All you need to do is run a game! Multi-Mouse intelligently determines RetroArch's global mouse config for player 1 games.

Virtual Multi-Mouse preflight has been removed and replaced with sophisticated central intelligance gathering. VMM is programmed to be smart, very smart. This takes time and thanks for your patience. Who knows may be one day it will be a full blown AI for all your Arcade needs. I'd be happy if VMM just made free ☕️ and 🍩. This software aims to be a zero-config-solution. We want VMM to be Auto-Magic!

Troubleshooting: If things are not working, try exiting your game and relaunching it. Sometimes and not often, VMM needs a jump start. If your mouse controllers are still not working, simply reboot Batocera. Still having trouble? Feel free to post an issue. I will respond as soon as possible.

Beginning with 1.0.9, at install Batocera.conf is set to be backed up. This is safegard incase something happens to this file. Virtual Multi-Mouse sets the global index here for EmulationStation and RetroArch configure. In the future, VMM will also include a clean batocera backup file. We plan to start packaging VMM and we may not be able to back up a file within a pacman pkg.

The Apple Magic Trackpad by default has been removed from Virtual Multi-Mouse. This Trackpad slows down and other Spinner and Trackball considerably. We recommend not using it (if you do, we can help you white list it). This also shows up as an (ABS) device within RetroArch logs v35 and v36. There is currently no mouse logging in v37, so VMM no longer reads RA logs. RetroArch orders (REL) devices first and (ABS) devices second. It's possible ABS devices are all trackpads, tablets and/or touch screens and lightguns. If so, we will start determining based on type, order them accordingly add them to the back of the list, and publish the log file incase you need to know what indexes your ABS devices are on as RA logging may go away.

Once we have all Absolute ABS device types determined

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
