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

# create a custom direwolf conf file, based on detected ptt method
cp /home/pi/digipi_plus/launchers/direwolf.rtlsdr.conf /tmp/direwolf.rtlsdr.conf
sudo mv /tmp/direwolf.rtlsdr.conf /run/direwolf.rtlsdr.conf

rtl_fm -f 144.390 - | direwolf -d i -p -q d -t 0 -D 1 -r 24000 -c /run/direwolf.rtlsdr.conf - | tee /home/pi/direwolf.log &

sleep 1 # wait for direwolf to initialize gpio

source <(head -n 25 localize.env)

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
