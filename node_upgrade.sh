
echo "Upgrading AX25 packet node with Hunt the Wumpus and Go Fish"

sudo apt install bsdgames -y
chmod +x ~/digipi_plus/node/gofish.sh
chmod +x ~/digipi_plus/node/wumpus.sh
chmod +x ~/digipi_plus/node/hamqsl.py
chmod +x ~/digipi_plus/node/space.py

echo "Backing up /etc/ax25/uronode.conf as /etc/ax25/uronode.conf.bak"
sudo cp /etc/ax25/uronode.conf /etc/ax25/uronode.conf.bak -v

echo "Backing up /etc/ax25/uronode.motd as /etc/ax25/uronode.motd.bak"
sudo cp /etc/ax25/uronode.motd /etc/ax25/uronode.motd.bak -v

echo "Making changes to /etc/ax25/uronode.conf"
sudo sed -i '/EMail/a \ExtCmd		WUmpus	3	nobody	/home/pi/digipi_plus/node/wumpus.sh wumpus.sh' /etc/ax25/uronode.conf
sudo sed -i '/WUmpus/a \ExtCmd		GOfish	1	nobody	/home/pi/digipi_plus/node/gofish.sh gofish.sh' /etc/ax25/uronode.conf
sudo sed -i '/EMail/a \ExtCmd		hamQSL	3	nobody	/home/pi/digipi_plus/node/hamqsl.py hamqsl.py' /etc/ax25/uronode.conf
sudo sed -i '/EMail/a \ExtCmd		SPACE	3	nobody	/home/pi/digipi_plus/node/space.py space.py' /etc/ax25/uronode.conf

echo "Making changes to /etc/ax25/uronode.motd"
sudo sed -i '/HITCH/a \  WUMP  - Play Hunt The Wumpus ' /etc/ax25/uronode.motd
sudo sed -i '/WUMP/a \  GO	- Play Go Fish ' /etc/ax25/uronode.motd
sudo sed -i '/HITCH/a \  QSL  - Get current band conditions ' /etc/ax25/uronode.motd
sudo sed -i '/HITCH/a \  SPACE  - Get current space WX ' /etc/ax25/uronode.motd
echo "Upgrade Complete"
