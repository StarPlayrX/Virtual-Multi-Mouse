## 🐭👾🖲️ Status update
There is an issue combining relative mouse devices such as trackballs and spinners with absolute devices such as lightguns and multitouch trackpads. Because of this, Virtual Multi-Mouse development will begin to separate these two types of devices. This means trackballs, mice and spinners will be combined as one virtual device and lightguns, and multitouch devices will be combined as a secondard virtual device. Will update on its progress. Currently no abs devices are supported at this time.

# 🐭👾🖲️ Virtual Multi-Mouse 1.1.2 🖲️👾🐭
### Project Game Play

The best auto-config solution on the universe. Combines your spinner, trackball, mouse into a virtual multi-mouse! Written from the ground up using intelligent code. Designed for Batocera Linux for use with Emulation Station and RetroArch.

## 🐭👾🖲️ Get Ready Player One!

Virtual Multi-Mouse auto configures trackball, spinner, mouse into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on v35, v36 and v37. Official lightgun support is coming soon! Future versions may learn what types of games you playing and setup your relative and absolute might accordingly. In other words, VMM will start to learn.

Like Batocera, Virtual Multi-Mouse is made to just play! Need to change your mouse configuration? Within a flash VMM sets up the virtual mouse accordingly. All you need to do is install VMM v1.1.0, reboot and run a game! The software automatically determines the proper mouse config for single player arcade games.

Virtual Multi-Mouse uses sophisticated central intelligance gathering. VMM is programmed to be smart, very smart. Upon every fresh reboot, it does an awesome job reconfiguring all your mouse devices into one global mouse for player one. This software aims to be a zero-config-solution. We want VMM to be Auto-Magic!

Troubleshooting: If things are not working, try exiting your game and relaunching it. Sometimes VMM needs a jump start. If your mouse controllers are still not working, simply reboot Batocera. Still having trouble? Feel free to post an issue. This is getting more rare as VMM can anticipate problems.

At install, the Batocera.conf file is backed up. This is safegard incase something happens. Virtual Multi-Mouse sets the global index here for EmulationStation and RetroArch to configure and if for any reason that files becomes defunct, your games could stop working. This is even rare, but having a backup of this file with every install gives you peace of mind.

Virtual Multi-Mouse natively supports relative usb devices this includes mouse, trackballs and spinners. Currently, we do not support devices which are multi-touch trackpads, lightguns and touch screens. These are absolute usb devices. More on this soon. There is a slow down when combining absolute Apple Magic Trackpads with relative mice. For this one reason absolute devices are ignored.

Virtual Multi-Mouse reviews all mouse indices upon startup. This includes its own index, all relative devices, all absolute devices. When a game starts, Batocera inserts its own virtual mouse-keyboard called "evmapy". It will always consume the next available slot. This is mostly harmless and usually gets added at the end, but if you remove any usb device, evampy on the next game will take the first available position. VMM keeps an eye on evampy whereabouts.

## 🐭👾🖲️ Now with Game Play!
While playing a game and you insert or remove a game controller, VMM no longer deactivate. Instead it will wait for the game to end and then it will re-check all the USB devices and then it will reactivate.

Each version of Virtual Multi-Mouse gets better and better! Our goal is to have VMM learn the games you play, know what controls you need, run a setup that is compatible with your hardware. This is possible and we plan to get there.

## 🐭👾🖲️ Ready to Enter the Multi-Verse?

0.  If you have smb:// file sharing working, you can copy files over instead of sneaker net (instructions to follow)
1.  you can curl this repo as well (will post instructions soon)
2.  Insert a thumb drive to a Mac or PC 
3.  Format it using ExFat, name the disk `install`
4.  Copy the `MM folder` to the thumb drive
5.  Insert the thumb drive to your Batocera Linux box
6.  Type `F1` to enter File Manager
7.  Navigate to /Applications and open Xterm
8.  `cd /media/install/MM`
9.  `chmod 755 install.sh` #may not be needed
10.  `./install.sh -install`
11.  `reboot`

## 🐭👾🖲️ Manual install instructions coming soon.
0. Until then, here is a brief summary for Batocera v37 and earlier
1. mm.sh goes in /userdata/system/scripts/ needs `chmod +x` or `755` rights
2. multimouse.sh and custom.sh goes in /userdata/system/ needs `chmod +x` or `755` rights
3. go to terminal, `cd /userdata/system`
4. `./custom.sh` start
5. or `reboot`

## 🐭👾🖲️ Manual install instructions for Batocera v38 and later, execute in terminal:

```
cp mm.sh /userdata/system/scripts/mm.sh
cp multimouse.sh /userdata/system/multimouse.sh
cp custom.sh /userdata/system/services/vmm
chmod 755 /userdata/system/scripts/mm.sh /userdata/system/multimouse.sh /userdata/system/services/vmm
batocera-services enable vmm
batocera-services start vmm
```

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
* https://github.com/kempniu/evmapy
* https://opensource.com/article/18/11/udev
* https://wiki.batocera.org/launch_a_script
* https://forums.libretro.com/t/configuring-ra-for-multi-mouse-spinners-lightguns-tackballs/12619E
* https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index

## 🐭👾🖲️ To Do
* Pacman package manager packages.
