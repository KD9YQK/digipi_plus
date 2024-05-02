#!/bin/bash

python3 uhf_helper.py
sudo cp temp/*.php www/ -v
sudo rm temp/*.php -v
chmod +x launchers/direwolf.uhf-tnc.sh
chmod +x launchers/direwolf.uhf-node.sh
sudo cp services/uhf-tnc.service /etc/systemd/system/ -v
sudo cp services/uhf-node.service /etc/systemd/system/ -v
ln -sf /home/pi/digipi_plus/launchers/direwolf.uhf-tnc.sh /home/pi -v
ln -sf /home/pi/digipi_plus/launchers/direwolf.uhf-node.sh /home/pi -v
sudo systemctl daemon-reload
