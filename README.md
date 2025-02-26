# DigiPi Plus
## Add additional functionality to KM6LYW DigiPi

You can find the DigiPi image here https://digipi.org/

You will need at least a 16gb SD Card that has been expanded to use the entire disk for a full install.  This is mainly due to Grid Tracker, which requires more than 1.3gb. You can learn how to expand the filesystem [here.](extend_filesystem.md)

## Features
1. AX25 Packet Node Upgrade
   - [Hunt the Wumpus](https://linuxcommandlibrary.com/man/wump) - BSD Game
   - [Go Fish](https://linuxcommandlibrary.com/man/go-fish) - BSD Game
   - [Space WX](https://github.com/bradbrownjr/bpq-apps) - Space Weather Conditions
   - [Ham QSL](https://github.com/bradbrownjr/bpq-apps) - A text version of the [hamqsl.com](https://hamqsl.com/) widgets.
   - Infocom Games - Zork II, Zork III, Zork Zero, Beyond Zork, Cutthroats, Enchanter
2. [PCSI](https://github.com/maqifrnswa/PCSI) - Packet Compressed Sensing Imaging over AX25
3. [OpenWebRX+](https://fms.komkon.org/OWRX/) - web-based SDR receiver
4. [Grid Tracker](https://gridtracker.org/) - GridTracker is a warehouse of amateur radio information presented in an easy to use interface, from live traffic decodes, logbooks, real-time spot reports, weather, current solar conditions and more!
5. RTL-SDR Support
   - RTL-SDR udev drivers
   - RTL-SDR APRS iGate
6. [JS8Spotter](https://kf7mix.com/js8spotter.html) - JS8Spotter can help users sort and track band activity, send APRS messages more easily, view stations on an offline map, send custom automated responses, and even implement simple forms.
7. [Xastir](https://xastir.org/index.php/Main_Page) - Xastir APRS Program
8. [gPredict](https://oz9aec.dk/gpredict/) - Real-time satellite tracking and orbit prediction application.
9. UHF Upgrade
   - TNC 9600 baud
   - AX25 Packet Node 9600 baud
10. [Trusted QSL](https://www.arrl.org/tqsl-download) - LOTW Logging Software
11. UHF 9600 Baud TNC and AX25 Node Support
12. [Ham Dashboard](https://github.com/VA3HDL/hamdashboard) - A Web based Ham Resource Dashboard
13. [MMBR](https://kd9yqk.com/mmbr/index.php) - Messages Must Be Received. A social media like blogging platform that utilizes multiple radio modes like JS8Call and APRS.
    - NOTE: This requires read/write to be enabled for sd-card. Will not work in the default read-only configuration!!!.
    - This tool is always running in the background.
15. [FL Utils](http://www.w1hkj.com/)
    - FLAmp
    - FLMsg
    - FLWrap
16. [VaraHF and VaraFM](https://www.varac-hamradio.com/) - Vara weak signal modems via Wine environment.
17. [Chirp-Next](https://chirpmyradio.com/projects/chirp/wiki/Home) - CHIRP is a free, open-source tool for programming your radio. It supports a large number of manufacturers and models, as well as provides a way to interface with multiple data sources and formats.

## Install
**DON'T install until AFTER initial setup of DigiPi!!! This only works for DigiPi version 1.9-2**
```
sudo remount
cd ~
sudo apt install dialog -y
git clone https://github.com/KD9YQK/digipi_plus.git
cd digipi_plus
bash digipi_plus.sh
```

## Known Issues
RTL-SDR will cause an error to occur on **Raspberry Pi 4** that looks like `rtlsdr_read_reg failed with -7` and `rtlsdr_write_reg failed with -7` when running Direwolf, or with OpenWebRX showing the device as inactive. There is an error in the firmware regarding the USB ports and communicating with the RTL-SDR. To fix, the firmware will need to be upgraded. For directions on how to fix, click [here.](kernel6.6_fix.md)

## Changelog
- 03/01/2025 - v1.4 Release
  1. Added VaraHF and VaraFM
  2. Updated to work with DigiPi 1.9.3
- 01/01/2025 - v1.31 Release
  1. Added FLAmp, FLMsg, and FLWrap
  2. Added MMBR
- 12/25/2024 - v1.3 Release
  1. Email and WebChat added to sidebar
  2. Added Help and Tutorials Web Pages
  3. Created Service for Xastir
  4. Minor changes to install script
  5. Added Ham Dashboard
  6. Added more Infocom Games
  7. Updated to work with DigiPi v.1.9-2
- 05/14/2024 - v1.2 Release
  1. Added JS8Spotter
  2. Added Xastir
  3. Added Logs, Shell, and VNC to Homepage
  4. Added Trusted QSL
  5. Added gPredict
  6. Added UHF 9600 Baud TNC and AX25 Node
  7. New 'dialog' installer
  8. Re-configured for easy future updates without need to re-flash.
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

