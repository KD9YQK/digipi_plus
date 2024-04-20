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
