# 🐭👾🖲️ Virtual Multi-Mouse 1.0.9 🖲️👾🐭

The best auto-config solution for combining your spinner, trackball, mouse and lightguns into one virtual mouse! Written from the ground up. RetroArch golden age arcade gaming on Batocera here we go!

## 🐭👾🖲️ Get Ready Player One!

Virtual Multi-Mouse auto configures trackball, spinner, mouse, lightgun into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on v35, v36 and v37.

Like Batocera it's made to just play! Need to change your mouse configuration? Within a flash it sets up the virtual mouse accordingly. All you need to do is run a game! Multi-Mouse intelligently determines RetroArch's global mouse config for player 1 games.

Known issue: The Apple Magic Trackpad by default has been removed from Virtual Multi-Mouse. This Trackpad slows down and Spinner and Trackball considerably. We recommend not using it. This trackpad also shows up as a ABS device with RetroArch logs v35 and v36. There is no mouse logging in v37, VMM no longer read RA logs. We currenty do not have the ability to distingush (REL) and (ABS) devices. In RetroArch 35 and 36 if you have --verbose logging turned on you can see which devices are ABS, if any. Hope to have a resolution on those devices soon. Currently only have seen Apple's devices at ABS. RetroArch orders (REL) devices first and (ABS) devices second.

Virtual Multi-Mouse preflight has been removed and replaced with sophisticated central intelligance gathering. VMM is programmed to by smart. This takes time to get it right and thanks for your patience. This software aims to be a zero-config-solution. We want VMM to be Auto-Magic!

Troubleshooting: If things are not working, try exiting your game and relaunching it. Sometimes and not often, VMM needs a jump start. If your mouse controllers are still not working, simply reboot Batocera. Still having trouble? Feel free to post an issue. I will respond as soon as possible.

At install Batocera.conf is set to be backed up. This is safegard incase something happens to this file. Virtual Multi-Mouse sets the global index here for EmulationStation and RetroArch configure. In the future, VMM will also include a clean batocera backup file. We plan to start packaging VMM and we may not be able to back up a file within a pacman pkg.

## 🐭👾🖲️ Ready to Enter the Multi-Verse?

1.  Insert a thumb drive to a Mac or PC (If you have smb// working, you can copy files over that way as well)
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

## 🐭👾🖲️ Manual install instructions coming soon.

0. Until there here it is in a nutshell
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
