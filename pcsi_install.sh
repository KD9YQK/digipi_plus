#!/bin/bash

sudo mkdir /var/www/html/pcsi -v
sudo cp www/pcsi/index.php /var/www/html/pcsi/ -v
chmod +x launchers/pcsi.sh
sudo cp ~/direwolf.tnc.conf launchers/direwolf.pcsi.conf -v
sudo cp services/pcsi.service /etc/systemd/system/ -v
ln -sf /home/pi/digipi_plus/launchers/pcsi.sh /home/pi -v
sudo systemctl daemon-reload

sudo apt install python3-opencv python3-tk python3-pil.imagetk python3-numpy python3-imageio python3-pil libopenblas0 -y
cd ~
git clone https://github.com/maqifrnswa/PCSI.git
python3 -m venv --system-site-packages PCSI
TMPDIR=/home/pi/tmp PCSI/bin/pip install pylbfgs pyserial
TMPDIR=/home/pi/tmp PCSI/bin/pip install bitstring==4.1.4
