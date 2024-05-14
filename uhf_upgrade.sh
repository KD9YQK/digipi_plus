#!/bin/bash

chmod +x launchers/direwolf.uhf-tnc.sh
chmod +x launchers/direwolf.uhf-node.sh
sudo cp services/uhf-tnc.service /etc/systemd/system/ -v
sudo cp services/uhf-node.service /etc/systemd/system/ -v
ln -sf /home/pi/digipi_plus/launchers/direwolf.uhf-tnc.sh /home/pi -v
ln -sf /home/pi/digipi_plus/launchers/direwolf.uhf-node.sh /home/pi -v
sudo systemctl daemon-reload
