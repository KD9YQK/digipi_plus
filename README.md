# DigiPi Plus
## Add additional functionality to KM6LYW DigiPi

You can find the DigiPi image here https://digipi.org/

You will need at least a 16gb SD Card that has been expanded to use the entire disk for a full install. You can learn how to expand the filesystem [here.](extend_filesystem.md)

## Features
1. AX25 Packet Node Upgrade
   - Hunt the Wumpus Game
   - Go Fish Game
2. [PCSI](https://github.com/maqifrnswa/PCSI) - Packet Compressed Sensing Imaging over AX25
3. [OpenWebRX+](https://fms.komkon.org/OWRX/) - web-based SDR receiver
4. [Grid Tracker](https://gridtracker.org/) - GridTracker is a warehouse of amateur radio information presented in an easy to use interface, from live traffic decodes, logbooks, real-time spot reports, weather, current solar conditions and more!
5. RTL-SDR Support
   - RTL-SDR udev drivers
   - RTL-SDR APRS iGate TODO

## Install
**DON'T install until AFTER initial setup of DigiPi!!! This only works for DigiPi version 1.8-2**
```
sudo remount
cd ~
git clone https://github.com/KD9YQK/digipi_plus.git
cd digipi_plus
bash install.sh
```

## Note

OpenWebRX requires the ability to write to the SD Card. I am still working on a viable solution for this...

RTL-SDR may cause an error to occur on Raspberry Pi 4. To fix, the firmware will need to be upgraded. **This hasn't been completely tested. Do at your own risk!**

`sudo rpi-update`
