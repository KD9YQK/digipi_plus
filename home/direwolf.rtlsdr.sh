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
cp /home/pi/direwolf.rtlsdr.conf /tmp/direwolf.rtlsdr.conf
sudo mv /tmp/direwolf.rtlsdr.conf /run/direwolf.rtlsdr.conf

rtl_fm -f 144.390 - | direwolf -d i -p -q d -t 0 -D 1 -r 24000 -c /run/direwolf.rtlsdr.conf - | tee /home/pi/direwolf.log &

sleep 1 # wait for direwolf to initialize gpio

# remove "-o" flag to see list of stations
if [ $NEWLAT = 39.9999 ]; then  # location not yet set
   sudo /home/pi/direwatch.py -o --log "/run/direwolf.log" --title_text "DigiPi RTLSDR"  &
else
   sudo /home/pi/direwatch.py -o --log "/run/direwolf.log" --title_text "DigiPi RTLSDR" --lat $NEWLAT --lon $NEWLON  &
fi

# wait for direwolf to open port 8001
sleep 1

sleep infinity

exit 0
