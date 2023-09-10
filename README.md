# 🐭👾🖲️ Virtual Multi-Mouse 1.1.2 🖲️👾🐭

VMM, combines your spinner, trackball, mouse into a virtual multi-mouse! VMM is designed for Batocera Linux for use with Emulation Station and RetroArch.

## 🐭👾🖲️ Get Ready Player One!

Virtual Multi-Mouse auto configures trackball, spinner, mouse into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on v35, v36 and v37. See manual install instructions for v38.

Like Batocera, Virtual Multi-Mouse is made to let you play. All you need to do is install VMM v1.1.2, reboot and run a game! The software automatically determines the proper mouse configuration for 1 up games.

Troubleshooting: If things are not working, try exiting your game and relaunching it. Sometimes VMM needs a jump start. Still having trouble? Feel free to post an issue.

At install, the Batocera.conf file is backed up. This is safegard incase something happens. Virtual Multi-Mouse sets the global index here for EmulationStation and RetroArch to configure and if for any reason that files becomes defunct, your games could stop working. This is even rare, but having a backup of this file with every install gives you peace of mind.

Virtual Multi-Mouse natively supports relative usb devices this includes mouse, trackballs and spinners. Currently, we do not support devices which are multi-touch trackpads, lightguns and touch screens. These are absolute usb devices. There is a slow down when combining absolute Apple Magic Trackpads with relative mice. For this one reason absolute devices are ignored.

Virtual Multi-Mouse reviews all mouse indices upon startup. This includes its own index, all relative devices, all absolute devices. When a game starts, Batocera inserts its own virtual mouse-keyboard called "evmapy". It will always consume the next available slot. This is mostly harmless and usually gets added at the end, but if you remove any usb device, evampy on the next game will take the first available position. VMM keeps an eye on evampy's whereabouts.

## 🐭👾🖲️ Now with Game Play!
While playing a game and you insert or remove a game controller, VMM no longer deactivates. Instead it will wait for the game to end and then it will re-check all the USB devices and reactivate.

## 🐭👾🖲️ Ready to Enter the Multi-Verse?

1.  From Batocera, type `F1` function key to enter the File Manager
2.  Navigate to /Applications and open Xterm

```
curl -sL https://github.com/StarPLayrX/Virtual-Multi-Mouse/archive/refs/heads/main.zip -o vmm.zip
unzip vmm.zip
cd Virtual-Multi-Mouse-main/MM
chmod 755 install.sh
./install.sh -install
./install.sh -restart
```

## 🐭👾🖲️ Want to Leave the Multi-Verse?

2.  Type `F1` to enter File Manager
3.  Navigate to /Applications and open Xterm
```
cd Virtual-Multi-Mouse-main/MM
./install.sh -uninstall
./installsh. -reboot
```

## 🐭👾🖲️ Manual install instructions for Batocera v38 and later, execute in terminal:

1.  From Batocera, type `F1` function key to enter the File Manager
2.  Navigate to /Applications and open Xterm

```
cp mm.sh /userdata/system/scripts/mm.sh
cp multimouse.sh /userdata/system/multimouse.sh
cp custom.sh /userdata/system/services/vmm
chmod 755 /userdata/system/scripts/mm.sh /userdata/system/multimouse.sh /userdata/system/services/vmm
batocera-services enable vmm
batocera-services start vmm
```

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
