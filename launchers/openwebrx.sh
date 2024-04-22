#!/bin/bash -x

trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing OpenWebRX"
   sudo killall openwebrx
   sudo rsync -avH /run/openwebrx/* /home/pi/config/openwebrx/
   exit 0
}

sudo mkdir /run/openwebrx
sudo cp -a /home/pi/config/openwebrx/* /run/openwebrx/
sudo chown -R pi:pi /run/openwebrx
openwebrx -c ~/digipi_plus/launchers/openwebrx.conf &

sudo /home/pi/direwatch.py -o --log "/run/direwolf.log" --title_text "DigiPi OpenWebRX"  &


sleep infinity

exit 0
