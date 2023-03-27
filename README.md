# 🐭👾🖲️ Virtual Multi-Mouse (MM) 1.0.6 🖲️👾🐭
The best zero-config solution for combining your spinner, trackball, mouse, etc into one virtual mouse! Written from the ground up. Ready to dive in for some golden age Arcade gaming?

## 🐭👾🖲️ Get Ready Player One!
Auto configures Trackball, Spinner, Mouse, Trackpad into one virtual device. Multi-Mouse works with Batocera v35 or later.

MM is the magic solution for combining multiple mouse inputs into a single virtual device. Supports any combination of spinners trackball, mouse or trackpads. We made Multi-Mouse so you can just play. Requires no editing. MM is designed to configure itself as one device.

Get ready player one. No hard encoded, hard to type event-mouse names. MM will hunt them down for you making the setup ultra easy. There's no editing after you swap out new mouse, trackball or spinner. No need to configure the mouse input for a single 1 player game.
 
Like Batocera it's plug and play. Need to change your hardware configuration? Simply reboot or restart your game. Multi-Mouse aims to be hotswappable as well. We made some progress with this release, but there's still more work to be done. We plan to make it work like any other usb device. Log scrapping may eventually be removed or used only as a checksum in the near future.

Known issue: on Batocera v35, for the mm.sh log scraper script, gameStart never gets called, but gameEnd does. This seems to be an error, as we think gameEnd is being called at gameStart.

## 🐭👾🖲️ Ready to enter the Multi-Verse?

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
11.  Enjoy!

## 🐭👾🖲️ Credits

* Virtual MM 1.0.6 StarPlayrX aka Todd Bruss
* MizterB for his initial post on Evseive, Batocera, Retroarch settings
* Special thanks to the Batocera team
* Shout out to the RetroArch, EmulationStation and Recalbox teams

## 🐭👾🖲️ Reference Material
https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/8
https://forum.batocera.org/d/6652-being-able-to-use-trackball-and-spinner-using-per-mouse-index/10
