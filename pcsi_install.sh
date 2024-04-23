#!/bin/bash

python3 pcsi_helper.py
sudo cp temp/*.php www/
sudo rm temp/*.php
sudo mkdir /var/www/html/pcsi
sudo cp www/pcsi/index.php /var/www/html/pcsi/
chmod +x launchers/pcsi.sh
sudo cp ~/direwolf.tnc.conf launchers/direwolf.pcsi.conf
sudo cp services/pcsi.service /etc/systemd/system/
sudo systemctl daemon-reload

sudo sed -i '/DigiPi Plus/a \        "pcsiGUI"               f.exec "python3 /home/pi/PCSI/pcsiGUI.py &"' /home/pi/.emwmrc

sudo apt install python3-opencv python3-tk python3-pil.imagetk -y
sudo pip install numpy imageio bitstring pylbfgs pyserial pillow
cd ~
git clone https://github.com/maqifrnswa/PCSI.git
