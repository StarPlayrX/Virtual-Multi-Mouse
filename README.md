# 🐭👾🖲️ Virtual Multi-Mouse 1.1.3

VMM has been discontinued - end of life. It's original author has moved to greener pastures. 

VMM, combines your spinner, trackball, mouse into a virtual multi-mouse! VMM is designed for Batocera Linux for use with Emulation Station and RetroArch.

This software auto configures trackball, spinner, mouse into one virtual device. Multi-Mouse works with Batocera v35 or later. Recently tested on Batocera v35, v36 and v37. 1.1.3 adds service support for beta 38.

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
* Installer service update for Batocera 38 by n2qz

## 🐭👾🖲️ Reference Material

* https://github.com/KarsMulder/evsieve
* https://github.com/kempniu/evmapy
* https://opensource.com/article/18/11/udev
* https://wiki.batocera.org/launch_a_script
* https://forums.libretro.com/t/configuring-ra-for-multi-mouse-spinners-lightguns-tackballs/12619E
* https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index
