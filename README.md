# DigiPi Plus
## Add additional functionality to KM6LYW DigiPi

You can find the DigiPi image here https://digipi.org/

You will need at least a 16gb SD Card that has been expanded to use the entire disk for a full install.  This is mainly due to Grid Tracker, which requires more than 1.3gb. You can learn how to expand the filesystem [here.](extend_filesystem.md)

## Features
1. AX25 Packet Node Upgrade
   - Hunt the Wumpus Game
   - Go Fish Game
   - Space WX
   - Ham QSL
2. [PCSI](https://github.com/maqifrnswa/PCSI) - Packet Compressed Sensing Imaging over AX25
3. [OpenWebRX+](https://fms.komkon.org/OWRX/) - web-based SDR receiver
4. [Grid Tracker](https://gridtracker.org/) - GridTracker is a warehouse of amateur radio information presented in an easy to use interface, from live traffic decodes, logbooks, real-time spot reports, weather, current solar conditions and more!
5. RTL-SDR Support
   - RTL-SDR udev drivers
   - RTL-SDR APRS iGate
6. [JS8Spotter](https://kf7mix.com/js8spotter.html) - JS8Spotter can help users sort and track band activity, send APRS messages more easily, view stations on an offline map, send custom automated responses, and even implement simple forms.
7. [Xastir](https://xastir.org/index.php/Main_Page) - Xastir APRS Program


## Install
**DON'T install until AFTER initial setup of DigiPi!!! This only works for DigiPi version 1.8-2**
```
sudo remount
cd ~
git clone https://github.com/KD9YQK/digipi_plus.git
cd digipi_plus
bash install.sh
```

## Known Issues
RTL-SDR will cause an error to occur on **Raspberry Pi 4** that looks like `rtlsdr_read_reg failed with -7` and `rtlsdr_write_reg failed with -7` when running Direwolf, or with OpenWebRX showing the device as inactive. There is an error in the firmware regarding the USB ports and communicating with the RTL-SDR. To fix, the firmware will need to be upgraded. For directions on how to fix, click [here.](kernel6.6_fix.md)

## Changelog
- ??/??/2024 - v1.2 Release
  1. Added JS8Spotter
  2. ???
- 04/23/2024 - v1.1 Release - Not compatable with previous version.
  1. Added Space WX and Ham QSL to AX25 Node
  2. Added new Homepage which organizes the menus, and adds the syslog in the blank free space
  3. Changed a majority of the install to use simlinks for easier future updates, and to be less intrusive to the original system.
- 04/11/2024 - v1.0 Initial Release
  1. RTL-SDR Support
  2. OpenWebRX+
  3. Grid Tracker
  4. PCSI
  5. AX25 Node games Hunt the Wumpus and Go Fish

