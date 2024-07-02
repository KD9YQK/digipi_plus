#!/bin/bash
if [ ! -f saves/plus.node ]; then
    echo "Upgrading AX25 packet node"
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

if [ ! -f saves/node/zork2.node ]; then
    options+=(5 "Zork II - The Wizard of Frobozz" off)
else
    options+=(5 "Zork II - The Wizard of Frobozz" on)
fi

if [ ! -f saves/node/zork3.node ]; then
    options+=(6 "Zork III - The Dungeon Master" off)
else
    options+=(6 "Zork III - The Dungeon Master" on)
fi

if [ ! -f saves/node/zork0.node ]; then
    options+=(7 "Zork Zero - The Revenge of Megaboz" off)
else
    options+=(7 "Zork Zero - The Revenge of Megaboz" on)
fi

if [ ! -f saves/node/zorkb.node ]; then
    options+=(8 "Beyond Zork - The Coconut of Quendor" off)
else
    options+=(8 "Beyond Zork - The Coconut of Quendor" on)
fi

if [ ! -f saves/node/cutthroats.node ]; then
    options+=(9 "Cutthroats" off)
else
    options+=(9 "Cutthroats" on)
fi

if [ ! -f saves/node/arthur.node ]; then
    options+=(10 "Arthur - The Quest for Excaliber" off)
else
    options+=(10 "Arthur - The Quest for Excaliber" on)
fi

if [ ! -f saves/node/enchanter.node ]; then
    options+=(11 "Enchanter" off)
else
    options+=(11 "Enchanter" on)
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
                chmod +x ~/digipi_plus/node/hamqsl.py
            else
                rm saves/node/hamqsl.node
            fi
            ;;
        2)
            if [ ! -f saves/spacewx.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		SPACE	3	nobody	/home/pi/digipi_plus/node/space.py space.py' /etc/ax25/uronode.conf
                sudo sed -i '/WEB/a \  SPACE - Get current space WX ' /etc/ax25/uronode.motd
                touch saves/node/spacewx.node
                chmod +x ~/digipi_plus/node/space.py
            else
                rm saves/node/spacewx.node
            fi
            ;;
        3)
            if [ ! -f saves/wumpus.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		WUmpus	3	nobody	/home/pi/digipi_plus/node/wumpus.sh wumpus.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  WUMP  - Play Hunt The Wumpus ' /etc/ax25/uronode.motd
                touch saves/node/wumpus.node
                sudo apt install bsdgames -y
                chmod +x ~/digipi_plus/node/wumpus.sh
            else
                rm saves/node/wumpus.node
            fi
            ;;
        4)
            if [ ! -f saves/gofish.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		GOfish	1	nobody	/home/pi/digipi_plus/node/gofish.sh gofish.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Go Fish ' /etc/ax25/uronode.motd
                touch saves/node/gofish.node
                sudo apt install bsdgames -y
                chmod +x ~/digipi_plus/node/gofish.sh
            else
                rm saves/node/gofish.node
            fi
            ;;
        5)
            if [ ! -f saves/zork2.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		Zork2	1	nobody	/home/pi/digipi_plus/node/zork2.sh zork2.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Zork II ' /etc/ax25/uronode.motd
                touch saves/node/zork2.node
                chmod +x ~/digipi_plus/node/zork2.sh
            else
                rm saves/node/zork2.node
            fi
            ;;
        6)
            if [ ! -f saves/zork3.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		Zork3	1	nobody	/home/pi/digipi_plus/node/zork3.sh zork3.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Zork III ' /etc/ax25/uronode.motd
                touch saves/node/zork3.node
                chmod +x ~/digipi_plus/node/zork3.sh
            else
                rm saves/node/zork3.node
            fi
            ;;
        7)
            if [ ! -f saves/zork0.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		Zork0	1	nobody	/home/pi/digipi_plus/node/zork0.sh zork0.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Zork Zero ' /etc/ax25/uronode.motd
                touch saves/node/zork0.node
                chmod +x ~/digipi_plus/node/zork0.sh
            else
                rm saves/node/zork0.node
            fi
            ;;
        8)
            if [ ! -f saves/zorkb.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		BeyondZork	1	nobody	/home/pi/digipi_plus/node/zorkb.sh zorkb.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Beyond Zork ' /etc/ax25/uronode.motd
                touch saves/node/zorkb.node
                chmod +x ~/digipi_plus/node/zorkb.sh
            else
                rm saves/node/zorkb.node
            fi
            ;;
        9)
            if [ ! -f saves/cutthroats.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		Cutthroats	1	nobody	/home/pi/digipi_plus/node/cutthroats.sh cuttthroats.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Cutthroats ' /etc/ax25/uronode.motd
                touch saves/node/cutthroats.node
                chmod +x ~/digipi_plus/node/cutthroats.sh
            else
                rm saves/node/cutthroats.node
            fi
            ;;
        10)
            if [ ! -f saves/arthur.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		Arthur	1	nobody	/home/pi/digipi_plus/node/arthur.sh arthur.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Arthur ' /etc/ax25/uronode.motd
                touch saves/node/arthur.node
                chmod +x ~/digipi_plus/node/arthur.sh
            else
                rm saves/node/arthur.node
            fi
            ;;
        11)
            if [ ! -f saves/enchanter.node ]; then
                sudo sed -i '/EMail/a \ExtCmd		Enchanter	1	nobody	/home/pi/digipi_plus/node/enchanter.sh enchanter.sh' /etc/ax25/uronode.conf
                sudo sed -i '/HITCH/a \  GO	- Play Enchanter ' /etc/ax25/uronode.motd
                touch saves/node/enchanter.node
                chmod +x ~/digipi_plus/node/enchanter.sh
            else
                rm saves/node/enchanter.node
            fi
            ;;
    esac
done
