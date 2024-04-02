
echo "Upgrading AX25 packet node with Hunt the Wumpus and Go Fish"

sudo apt install bsdgames
mkdir ~/games
cp home/games/*.* ~/games/

echo "Backing up /etc/ax25/uronode.conf as /etc/ax25/uronode.conf.bak"
sudo cp /etc/ax25/uronode.conf /etc/ax25/uronode.conf.bak

echo "Backing up /etc/ax25/uronode.motd as /etc/ax25/uronode.motd.bak"
sudo cp /etc/ax25/uronode.motd /etc/ax25/uronode.motd.bak

echo "Making changes to /etc/ax25/uronode.conf"
sudo sed -i '/EMail/a \ExtCmd		WUmpus	3	nobody	/home/pi/games/wumpus.sh wumpus.sh' /etc/ax25/uronode.conf
sudo sed -i '/WUmpus/a \ExtCmd		GOfish	1	nobody	/home/pi/games/gofish.sh gofish.sh' /etc/ax25/uronode.conf

echo "Making changes to /etc/ax25/uronode.motd"
sudo sed -i '/HITCH/a \  WUMP  - Play Hunt The Wumpus ' /etc/ax25/uronode.motd
sudo sed -i '/WUMP/a \  GO	- Play Go Fish ' /etc/ax25/uronode.motd

echo "Upgrade Complete"
