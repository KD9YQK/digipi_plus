# DigiPi Plus
## Add additional functionality to KM6LYW DigiPi

You can find the DigiPi image here https://digipi.org/

You will need at least a 16gb SD Card that has been expanded to use the entire disk for a full install.  This is mainly due to Grid Tracker, which requires more than 1.3gb. You can learn how to expand the filesystem [here.](extend_filesystem.md)

## Features
1. AX25 Packet Node Upgrade
   - Hunt the Wumpus Game
   - Go Fish Game
2. [PCSI](https://github.com/maqifrnswa/PCSI) - Packet Compressed Sensing Imaging over AX25
3. [OpenWebRX+](https://fms.komkon.org/OWRX/) - web-based SDR receiver
4. [Grid Tracker](https://gridtracker.org/) - GridTracker is a warehouse of amateur radio information presented in an easy to use interface, from live traffic decodes, logbooks, real-time spot reports, weather, current solar conditions and more!
5. RTL-SDR Support
   - RTL-SDR udev drivers
   - RTL-SDR APRS iGate

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
RTL-SDR will cause an error to occur on **Raspberry Pi 4** that looks like `rtlsdr_read_reg failed with -7` and `rtlsdr_write_reg failed with -7` when running Direwolf, or with OpenWebRX showing the device as inactive. There is an error in the firmware regarding the USB ports and communicating with the RTL-SDR. To fix, the firmware will need to be upgraded. **This hasn't been completely tested. Do at your own risk!** According to Craig KM6LYW, this will break the functionality of the GPIO pins.
   ```
   sudo rpi-update
   ```
** This does in fact break GPIO functionality. If your not using the Raspberry Pi 4 GPIO for ANYTHING, then it is ok to do, but if you plan to use TFT screen, LEDs, PTT, etc then better not do.  

## Potential GPIO Fix - 4/13/2024 - In Testing
1) First let's fix the python module. This will replace RPi.GPIO with a newer module that uses the same commands.
   ```
   sudo apt update && sudo apt install python3-rpi-lgpio  --auto-remove --purge
   ```
2) Next We need to fix the issue of pins not showing in /sys/class/gpio. We will use the 'sysfs-gpio-shim' by info-beamer https://github.com/info-beamer/sysfs-gpio-shim.

3) This is going to require building libgpiod2.1. Lets do that first.
   ```
   cd ~
   git clone https://github.com/brgl/libgpiod.git
   cd libgpiod
   ./autogen.sh
   make
   sudo make install
   ```
4) Next let's install the required libraries to compile sysfs-gpio-shim. We aren't going to compile just yet, we needed to build libgpiod and install libfuse3-dev **before** updating the kernel to 6.6.
   ```
   sudo apt install libfuse3-dev
   ```
5) Update the kernel to 6.6
   ```
   sudo rpi-update
   sudo reboot
   ```
6) Finally, it is time to build sysfs-gpio-shim
   ```
   sudo remount
   cd ~
   git clone https://github.com/info-beamer/sysfs-gpio-shim.git
   cd sysfs-gpio-shim
   git checkout ac2faee
   make
   ```

7) Go to the /home/pi directory, and create a new script file
```
cd ~
nano kernel_gpio_fix.sh
```
8) Paste the following into that file and save it.
   ```
   cd /home/pi/sysfs-gpio-shim
   GPIO_GID="$(cut -d: -f3 < <(getent group gpio))"
   sudo ./sysfs-gpio-shim -o default_permissions,allow_other,gid=$GPIO_GID /sys/class/gpio
   echo 12 > /sys/class/gpio/export
   echo 16 > /sys/class/gpio/export
   ```
   Make i execuable
   ```
   chmod +x kernel_gpio_fix.sh
   ```
   
10) Place it in `rc.local` so it runs as boot
```
sudo nano /etc/rc.local
```
10) Look for the line near the top starting with `rfkill` Right below that line, add a new line with the following `bash /home/pi/kernel_gpio_fix.sh`

11) Now we need to edit direwatch.py in a few places. Let's start with making a backup of our work.
```
cd ~
cp direwatch.py direwatch.py.bak -v
nano direwatch.py
```
12) croll down until you find the **imports**. Put a `#` in front of `import LED`, then add `import RPi.GPIO as GPIO` to the bottom of the list below `import numpy`.

13) Scroll down a bit more until you find `def bluetooth_connection_poll_thread():`. In that function, remove the `#` in front of each line starting with `GPIO` (4 places) and add a `#` in front of each line starting with `blue_led` (3 places)

14) reboot the system `sudo reboot`

Bob's Your Uncle! The GPIO pins **should** be fixed for kernel 6.6.
