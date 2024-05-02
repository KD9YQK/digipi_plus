#!/bin/bash -x

trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing direwolf in UHF TNC mode"
   sudo killall direwolf
   sudo killall rfcomm
   sudo killall -9 direwatch.py
   exit 0
}

# zero out old direwolf log file in case /run/ is full
truncate --size 0 /run/direwolf.log

# create a custom direwolf conf file, based on detected ptt method
cp /home/pi/direwolf.tnc.conf /tmp/direwolf.tnc.conf
USBPRESENT=`grep "USB" /proc/asound/cards | wc -l`
source <(head -n 25 localize.sh)
if [ $NEWRIGNUMBER = DTR ]; then  
  sed -i "s/\#PTT \/dev\/DEVICEFILE DTR/PTT \/dev\/$NEWDEVICEFILE DTR/gi" /tmp/direwolf.tnc.conf 
elif [ $NEWRIGNUMBER = RTS ]; then  
  sed -i "s/\#PTT \/dev\/DEVICEFILE RTS/PTT \/dev\/$NEWDEVICEFILE RTS/gi" /tmp/direwolf.tnc.conf
elif [ $USBPRESENT -eq 0 -o $NEWRIGNUMBER = GPIO ]; then
  sed -i "s/\#PTT GPIO/PTT GPIO/gi" /tmp/direwolf.tnc.conf
else
  sed -i "s/\#PTT RIG RIGNUMBER DEVICEFILE/PTT RIG $NEWRIGNUMBER \/dev\/$NEWDEVICEFILE/gi" /tmp/direwolf.tnc.conf
fi

sudo mv /tmp/direwolf.tnc.conf /run/direwolf.tnc.conf

direwolf -B 9600 -r 48000 -d t -p -q d -t 0 -c /run/direwolf.tnc.conf | tee /home/pi/direwolf.log &

sleep 1 # wait for direwolf to initialize gpio

# remove "-o" flag to see list of stations
if [ $NEWLAT = 39.9999 ]; then  # location not yet set
   sudo /home/pi/direwatch.py -o --log "/run/direwolf.log" --title_text "DigiPi TNC"  &
else
   sudo /home/pi/direwatch.py -o --log "/run/direwolf.log" --title_text "DigiPi TNC" --lat $NEWLAT --lon $NEWLON  &
fi

# wait for direwolf to open port 8001
sleep 1

# bind bluetooth serial port to direwolf's KISS interface on port 8001
# sudo rfcomm --raw watch /dev/rfcomm0 1 socat -d -d tcp4:127.0.0.1:8001 /dev/rfcomm0  > /tmp/rfcom.out 2>/tmp/rfcom.out

sleep infinity

exit 0
