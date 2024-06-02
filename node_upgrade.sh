#!/bin/bash
if [ ! -f saves/plus.node ]; then
    echo "Upgrading AX25 packet node"
    sudo apt install bsdgames -y
    chmod +x ~/digipi_plus/node/gofish.sh
    chmod +x ~/digipi_plus/node/wumpus.sh
    chmod +x ~/digipi_plus/node/hamqsl.py
    chmod +x ~/digipi_plus/node/space.py

    echo "Backing up /etc/ax25/uronode.conf as /etc/ax25/uronode.conf.bak"
    sudo cp /etc/ax25/uronode.conf /etc/ax25/uronode.conf.bak -v

    echo "Backing up /etc/ax25/uronode.motd as /etc/ax25/uronode.motd.bak"
    sudo cp /etc/ax25/uronode.motd /etc/ax25/uronode.motd.bak -v
    echo "Upgrade Complete"
fi

sudo cp /etc/ax25/uronode.conf.bak /etc/ax25/uronode.conf
sudo cp /etc/ax25/uronode.motd.bak /etc/ax25/uronode.motd

if [ ! -f saves/node/hamqsl.node ]; then
    options+=(1 "Ham QSL" off)
else
    options+=(1 "Ham QSL" on)
fi

if [ ! -f saves/node/spacewx.node ]; then
    options+=(2 "Space WX" off)
else
    options+=(2 "Space WX" on)
fi

if [ ! -f saves/node/wump.node ]; then
    options+=(3 "Hunt the Wumpus" off)
else
    options+=(3 "Hunt the Wumpus" on)
fi

if [ ! -f saves/node/gofish.node ]; then
    options+=(4 "Go Fish" off)
else
    options+=(4 "Go Fish" on)
fi

#build dialogue box with menu options
cmd=(dialog --backtitle "AX25 Packet Node Upgrades" --checklist "Which items would you like added to the AX25 Packet Node?" 22 50 16)
choices=($("${cmd[@]}" "${options[@]}" 2>&1 1>/dev/tty))

for choice in "${choices[@]}"; do
    case $choice in
        1)
            if [ ! -f saves/hamqsl.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		HAMQSL	3	nobody	/home/pi/digipi_plus/node/hamqsl.py hamqsl.py' /etc/ax25/uronode.conf
                sudo sed -i '/WEB/a \  HAMQSL - Get current band conditions ' /etc/ax25/uronode.motd
                touch saves/node/hamqsl.node
            else
                rm saves/node/hamqsl.node
            fi
            ;;
        2)
            if [ ! -f saves/spacewx.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		SPACE	3	nobody	/home/pi/digipi_plus/node/space.py space.py' /etc/ax25/uronode.conf
                sudo sed -i '/WEB/a \  SPACE - Get current space WX ' /etc/ax25/uronode.motd
                touch saves/node/spacewx.node
            else
                rm saves/node/spacewx.node
            fi
            ;;
        3)
            if [ ! -f saves/wumpus.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		WUmpus	3	nobody	/home/pi/digipi_plus/node/wumpus.sh wumpus.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  WUMP  - Play Hunt The Wumpus ' /etc/ax25/uronode.motd
                touch saves/node/wumpus.node
            else
                rm saves/node/wumpus.node
            fi
            ;;
        4)
            if [ ! -f saves/gofish.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		GOfish	1	nobody	/home/pi/digipi_plus/node/gofish.sh gofish.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Go Fish ' /etc/ax25/uronode.motd
                touch saves/node/gofish.node
            else
                rm saves/node/gofish.node
            fi
            ;;
    esac
done
