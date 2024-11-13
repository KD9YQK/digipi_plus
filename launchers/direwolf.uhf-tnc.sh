#!/bin/bash -x

trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing direwolf in TNC mode"
   sudo killall direwolf
   sudo killall rfcomm
   sudo killall -9 direwatch.py
   exit 0
}

# zero out old direwolf log file in case /run/ is full
truncate --size 0 /run/direwolf.log

# prioritize USB audio device 
grep -i usb /proc/asound/cards > /dev/null 2>&1
if [ $? -eq 0 ]; then
   export ALSA_CARD=`grep -i usb /proc/asound/cards | head -1 | cut -c 2-2`
else
   export ALSA_CARD=0
fi
echo "ALSA_CARD:  $ALSA_CARD"

# create a custom direwolf conf file, based on detected ptt method
cp /home/pi/direwolf.tnc.conf /tmp/direwolf.tnc.conf
source <(head -n 25 localize.env)
USBPRESENT=`grep "USB" /proc/asound/cards | wc -l`
if [ $NEWRIGNUMBER = DTR ]; then  
  sed -i "s/\#PTT \/dev\/DEVICEFILE DTR/PTT \/dev\/$NEWDEVICEFILE DTR/gi" /tmp/direwolf.tnc.conf 
elif [ $NEWRIGNUMBER = RTS ]; then  
  sed -i "s/\#PTT \/dev\/DEVICEFILE RTS/PTT \/dev\/$NEWDEVICEFILE RTS/gi" /tmp/direwolf.tnc.conf
elif [ $USBPRESENT -eq 0 -o $NEWRIGNUMBER = GPIO ]; then
  GPIOCHIP=`gpiofind GPIO12 | cut -f 1 -d\ `
  sed -i "s/\#PTT GPIOD gpiochip0/PTT GPIOD $GPIOCHIP/" /tmp/direwolf.tnc.conf
  sed -i "s/\DCD GPIOD gpiochip0/DCD GPIOD $GPIOCHIP/" /tmp/direwolf.tnc.conf
else
  sed -i "s/\#PTT RIG RIGNUMBER DEVICEFILE/PTT RIG $NEWRIGNUMBER \/dev\/$NEWDEVICEFILE/gi" /tmp/direwolf.tnc.conf
fi

sudo mv /tmp/direwolf.tnc.conf /run/direwolf.tnc.conf

direwolf -B 9600 -r 48000 -d t -d o -p -q d -t 0 -c /run/direwolf.tnc.conf |& grep --line-buffered -v PTT_METHOD > /home/pi/direwolf.log   &

#direwolf -B 9600 -r 48000 -d t -p -q d -t 0 -c /run/direwolf.tnc.conf | tee /home/pi/direwolf.log &

sleep 1 # wait for direwolf to initialize gpio

# remove "-o" flag to see list of stations
if [ $NEWLAT = 39.9999 ]; then  # location not yet set
   sudo /home/pi/direwatch.py -o --save "/run/direwatch.png" --log "/run/direwolf.log" --title_text "DigiPi TNC" --display $NEWDISPLAYTYPE  &
else
   sudo /home/pi/direwatch.py -o --save "/run/direwatch.png" --log "/run/direwolf.log" --title_text "DigiPi TNC" --lat $NEWLAT --lon $NEWLON --display $NEWDISPLAYTYPE &
fi

# wait for direwolf to open port 8001
sleep 1

# bind bluetooth serial port to direwolf's KISS interface on port 8001
sudo rfcomm --raw watch /dev/rfcomm0 1 socat -d -d tcp4:127.0.0.1:8001 /dev/rfcomm0  > /tmp/rfcom.out 2>/tmp/rfcom.out

sleep infinity

exit 0
