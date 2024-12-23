#!/bin/bash -x

trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing direwolf in Xastir mode"
   sudo killall direwolf
   sudo killall rfcomm
   sudo killall -9 direwatch.py
   vncserver -kill :1
   sudo kill `ps aux | grep launch | grep -v grep | awk '{print $2}'`  # novnc socket
   sudo killall xastir
   sudo sh -c  "echo powersave  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
   sudo mount -a -o remount
   exit 0
}

sudo sh -c  "echo performance  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"

# stop stuff
vncserver -kill :1
sudo kill `ps aux | grep launch | grep -v grep | awk '{print $2}'`  # novnc socket
sudo killall qsstv 
sudo killall pcsi 
sudo killall xastir
sudo service wsjtx stop

cd ~
# zero out old direwolf log file in case /run/ is full
truncate --size 0 /run/direwolf.log

# create a custom direwolf conf file, based on detected ptt method
cp /home/pi/digipi_plus/launchers/direwolf.xastir.conf /tmp/direwolf.xastir.conf
USBPRESENT=`grep "USB" /proc/asound/cards | wc -l`
source <(head -n 25 ~/localize.sh)
if [ $NEWRIGNUMBER = DTR ]; then  
  sed -i "s/\#PTT \/dev\/DEVICEFILE DTR/PTT \/dev\/$NEWDEVICEFILE DTR/gi" /tmp/direwolf.xastir.conf 
elif [ $NEWRIGNUMBER = RTS ]; then  
  sed -i "s/\#PTT \/dev\/DEVICEFILE RTS/PTT \/dev\/$NEWDEVICEFILE RTS/gi" /tmp/direwolf.xastir.conf
elif [ $USBPRESENT -eq 0 -o $NEWRIGNUMBER = GPIO ]; then
  sed -i "s/\#PTT GPIO/PTT GPIO/gi" /tmp/direwolf.xastir.conf
else
  sed -i "s/\#PTT RIG RIGNUMBER DEVICEFILE/PTT RIG $NEWRIGNUMBER \/dev\/$NEWDEVICEFILE/gi" /tmp/direwolf.xastir.conf
fi

sudo mv /tmp/direwolf.xastir.conf /run/direwolf.xastir.conf

direwolf -d t -p -q d -t 0 -c /run/direwolf.xastir.conf | tee /home/pi/direwolf.log &

sleep 1 # wait for direwolf to initialize gpio

# remove "-o" flag to see list of stations
if [ $NEWLAT = 39.9999 ]; then  # location not yet set
   sudo /home/pi/direwatch.py -o --save "/run/direwatch.png" --log "/run/direwolf.log" --title_text "Xastir"  &
else
   sudo /home/pi/direwatch.py -o --save "/run/direwatch.png" --log "/run/direwolf.log" --title_text "Xastir" --lat $NEWLAT --lon $NEWLON  &
fi

# wait for direwolf to open port 8001
sleep 1

# bind bluetooth serial port to direwolf's KISS interface on port 8001
#sudo rfcomm --raw watch /dev/rfcomm0 1 socat -d -d tcp4:127.0.0.1:8001 /dev/rfcomm0  > /tmp/rfcom.out 2>/tmp/rfcom.out

# start stuff
nice -n 5 vncserver -depth 16                                   # runs in background
/home/pi/digibanner.py -b Xastir -s http://digipi/xastir             # momentary run
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 &

export DISPLAY=:1   
sudo remount
xastir &

sleep 8 
sudo killall flrig

sudo renice -n 0 `ps aux | grep xastir | grep -v grep | awk '{print $2}'`
sudo renice -n 5 `ps aux | grep Xtightvnc | grep -v grep | awk '{print $2}'`

sleep infinity

echo "URL is http://digipi:6080/vnc.html?host=digipi&port=6080&password=test11&autoconnect=true "

exit 0
