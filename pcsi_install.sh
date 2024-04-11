!#/bin/bash

python3 pcsi_helper.py
sudo cp temp/*.php /var/www/html/
sudo rm temp/*.php
sudo mkdir /var/www/html/pcsi
sudo cp www/pcsi/index.php /var/www/html/pcsi/
cp home/pcsi.sh ~/
chmod +x ~/pcsi.sh
sudo cp ~/direwolf.tnc.conf ~/direwolf.pcsi.conf
sudo cp services/pcsi.service /etc/systemd/system/
sudo systemctl daemon-reload

sudo sed -i '/DigiPi Plus/a \        "pcsiGUI"               f.exec "python3 /home/pi/PCSI/pcsiGUI.py &"' /home/pi/.emwmrc

sudo apt install python3-opencv python3-tk python3-pil.imagetk -y
sudo pip install numpy imageio bitstring pylbfgs pyserial pillow
cd ~
git clone https://github.com/maqifrnswa/PCSI.git
