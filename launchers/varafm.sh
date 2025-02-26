#!/bin/bash -x

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing VaraFM stuff."
   vncserver -kill :1
   sudo kill `ps aux | grep launch | grep -v grep | awk '{print $2}'`  # novnc socket
   sudo killall wine
   sudo sh -c  "echo powersave  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"

   exit 0
}

sudo sh -c  "echo performance  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"

source ~/localize.env

# stop stuff
vncserver -kill :1
sudo kill `ps aux | grep launch | grep -v grep | awk '{print $2}'`  # novnc socket
sudo killall pcsiGUI 

# start stuff
nice -n 5 vncserver -depth 16                               # runs in background
/home/pi/digibanner.py -b VARAFM -s http://digipi/vara -d $NEWDISPLAYTYPE
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 &

export DISPLAY=:1  

varafm &

sleep 8 
sudo killall flrig

sudo renice -n 0 `ps aux | grep wine | grep -v grep | awk '{print $2}'`
sudo renice -n 5 `ps aux | grep Xtightvnc | grep -v grep | awk '{print $2}'`

sleep infinity
