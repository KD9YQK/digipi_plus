#!/bin/bash

python3 uhf_helper.py
sudo cp temp/*.php www/ -v
sudo rm temp/*.php -v
chmod +x launchers/direwolf.uhf-tnc.sh
chmod +x launchers/direwolf.uhf-node.sh
sudo cp ~/direwolf.tnc.conf launchers/direwolf.uhf-tnc.conf -v
sudo cp ~/direwolf.node.conf launchers/direwolf.uhf-node.conf -v
sudo cp services/direwolf.uhf-tnc.service /etc/systemd/system/ -v
sudo cp services/direwolf.uhf-node.service /etc/systemd/system/ -v
ln -sf /home/pi/digipi_plus/launchers/direwolf.uhf-tnc.sh /home/pi -v
ln -sf /home/pi/digipi_plus/launchers/direwolf.uhf-node.sh /home/pi -v
sudo systemctl daemon-reload
