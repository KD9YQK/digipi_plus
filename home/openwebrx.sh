#!/bin/bash -x

trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing OpenWebRX"
   sudo killall openwebrx
   rsync -avH /run/openwebrx/* /home/pi/config/openwebrx/
   exit 0
}

sudo mkdir /run/openwebrx
sudo cp -a home/pi/config/openwebrx/* /run/openwebrx/
sudo chown -R pi:pi /run/openwebrx
openwebrx -c ~/openwebrx.conf &

# remove "-o" flag to see list of stations
if [ $NEWLAT = 39.9999 ]; then  # location not yet set
   sudo /home/pi/direwatch.py -o --log "/run/direwolf.log" --title_text "DigiPi OpenWebRX"  &
else
   sudo /home/pi/direwatch.py -o --log "/run/direwolf.log" --title_text "DigiPi OpenWebRX" --lat $NEWLAT --lon $NEWLON  &
fi


sleep infinity

exit 0
