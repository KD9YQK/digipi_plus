#!/bin/bash -x

trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing OpenWebRX"
   sudo killall openwebrx
   # Attempt to save configs if in rw mode
   sudo rsync -avH /run/openwebrx/* /home/pi/config/openwebrx/
   exit 0
}

sudo mkdir /run/openwebrx
sudo cp -a /home/pi/config/openwebrx/* /run/openwebrx/
sudo chown -R pi:pi /run/openwebrx
openwebrx -c ~/digipi_plus/launchers/openwebrx.conf &

/home/pi/digibanner.py -b OpenWebRx+ -s http://digipi/openwebrx -d $NEWDISPLAYTYPE


sleep infinity

exit 0
