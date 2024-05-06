#!/bin/bash

echo ""
echo "DigiPi Plus Installer"
echo "Created by Bob - KD9YQK"
echo ""
sleep 1
echo -n "Checking for Base..."
sleep 1
if [ ! -f saves/plus.base ]; then
    echo "NOT FOUND"
    echo "Installing DigiPi Plus Base"
    sleep 1
    echo "Backing up files"
    sudo cp /var/www/html/index.php backup/ -v
    sudo cp /var/www/html/styles/simple.css backup/ -v
    sudo rm /var/www/html/styles/simple.css -v
    sudo rm /var/www/html/index.php -v
    cp ~/.emwmrc backup/emwmrc -v
    cp /etc/systemd/system/*.service backup/ -v
    echo "Copying Files"
    cp home/emwmrc_plus ~/.emwmrc -v
    echo "Creating Simlinks"
    sudo ln -sf /home/pi/digipi_plus/www/*.php /var/www/html/ -v
    sudo ln -sf /home/pi/digipi_plus/www/*.css /var/www/html/styles -v
    touch saves/plus.base
    echo "DigiPi Plus Base Installed"
else
    echo "OK"
fi

installed="Installed:\n"
if [ ! -f saves/plus.node ]; then
    options+=(1 "AX25 Node Upgrade" off)
else
    installed+="AX25 Node Upgrade, "
fi

if [ ! -f saves/plus.uhf ]; then
    options+=(2 "UHF 9600 Baud Upgrade" off)
else
    installed+="UHF 9600 Baud Upgrade, "
fi

if [ ! -f saves/plus.pcsi ]; then
    options+=(3 "PCSI" off)
else
    installed+="PCSI, "
fi

if [ ! -f saves/plus.gridtracker ]; then
    options+=(4 "Grid Tracker" off)
else
    installed+="Grid Tracker, "
fi

if [ ! -f saves/plus.js8spotter ]; then
    options+=(5 "JS8Spotter" off)
else
    installed+="JS8Spotter, "
fi

if [ ! -f saves/plus.gpredict ]; then
    options+=(6 "gPredict" off)
else
    installed+="gPredict, "
fi

if [ ! -f saves/plus.xastir ]; then
    options+=(7 "Xastir" off)
else
    installed+="Xastir, "
fi

if [ ! -f saves/plus.tqsl ]; then
    options+=(8 "Trusted QSL" off)
else
    installed+="Trusted QSL, "
fi

if [ ! -f saves/plus.openwebrx ]; then
    options+=(9 "OpenWebRX+" off)
else
    installed+="OpenWebRX+, "
fi

if [ ! -f saves/plus.rtl-sdr ]; then
    options+=(10 "RTL-SDR Drivers" off)
else
    installed+="RTL-SDR Drivers, "
fi

if [ ! -f saves/plus.sdr_igate ]; then
    options+=(11 "RTL-SDR iGate" off)
else
    installed+="RTL-SDR iGate, "
fi


#build dialogue box with menu options
cmd=(dialog --backtitle "DigiPi Plus" --checklist "${installed}" 22 50 16)
choices=($("${cmd[@]}" "${options[@]}" 2>&1 1>/dev/tty))

for choice in "${choices[@]}"; do
    case $choice in
        1)
            echo -n "Checking for AX25 Upgrade..."
            sleep 1
            if [ ! -f saves/plus.node ]; then
                echo "NOT FOUND"
                echo "Installing AX25 Node Upgrade"
                sleep 1
                bash node_upgrade.sh
                touch saves/plus.node
                echo "AX25 Upgrade Installed"
            else
                echo "OK"
            fi
            ;;
        2)
            echo -n "Checking for UHF Upgrade..."
            sleep 1
            if [ ! -f saves/plus.uhf ]; then
                echo "NOT FOUND"
                echo "Installing UHF TNC and Node"
                sleep 1
                bash uhf_upgrade.sh
                touch saves/plus.uhf
                echo "UHF Upgrade Installed"
            else
                echo "OK"
            fi
            ;;
        3)
            echo -n "Checking for PCSI..."
            sleep 1
            if [ ! -f saves/plus.pcsi ]; then
                echo "NOT FOUND"
                echo "Installing PCSI"
                sleep 1
                bash pcsi_install.sh
                touch saves/plus.pcsi
                echo "PCSI Installed"
            else
                echo "OK"
            fi
            ;;
        4)
            echo -n "Checking for Grid Tracker..."
            sleep 1
            if [ ! -f saves/plus.gridtracker ]; then
                echo "NOT FOUND"
                echo "Installing Grid Tracker"
                mkdir ~/Documents
                sleep 1
                curl  https://debian.gridtracker.org/gridtracker_deb_install.sh | sudo bash
                sudo apt update
                sudo apt install gridtracker -y
                touch saves/plus.gridtracker
                echo "Grid Tracker Installed"
            else
                echo "OK"
            fi
            ;;
        5)
            echo -n "Checking for JS8Spotter..."
            sleep 1
            if [ ! -f saves/plus.js8spotter ]; then
                echo "NOT FOUND"
                echo "Installing JS8Spotter"
                sleep 1
                wget https://kf7mix.com/files/js8spotter/js8spotter-110b_src.zip
                mkdir js8spotter
                unzip js8spotter-110b_src.zip
                cp -r js8spotter-110b_src/* js8spotter/
                rm -r js8spotter-110b_src
                rm js8spotter-110b_src.zip
                touch saves/plus.js8spotter
                echo "JS8Spotter Installed"
            else
                echo "OK"
            fi
            ;;
        6)
            echo -n "Checking for gPredict..."
            sleep 1
            if [ ! -f saves/plus.gpredict ]; then
                echo "NOT FOUND"
                echo "Installing gPredict"
                sleep 1
                sudo apt install gpredict -y
                touch saves/plus.gpredict
                echo "gPredict Installed"
            else
                echo "OK"
            fi
            ;;
        7)
            echo -n "Checking for Xastir..."
            sleep 1
            if [ ! -f saves/plus.xastir ]; then
                echo "NOT FOUND"
                echo "Installing Xastir"
                sleep 1
                bash xastir_install.sh
                touch saves/plus.xastir
                echo "Xastir Installed"
            else
                echo "OK"
            fi
            ;;
        8)
            echo -n "Checking for Trusted QSL..."
            sleep 1
            if [ ! -f saves/plus.tqsl ]; then
                echo "NOT FOUND"
                echo "Installing Trusted QSL"
                sleep 1
                bash tqsl_install.sh
                touch saves/plus.tqsl
                echo "Trusted QSL Installed"
            else
                echo "OK"
            fi
            ;;
        9)
            echo -n "Checking for OpenWebRX..."
            sleep 1
            if [ ! -f saves/plus.openwebrx ]; then
                echo "NOT FOUND"
                echo "Installing OpenWebRX"
                sleep 1
                bash openwebrx_install.sh
                touch saves/plus.openwebrx
                echo "OpenWebRX Installed"
            else
                echo "OK"
            fi
            ;;
        10)
            echo -n "Checking for RTL-SDR Drivers..."
            sleep 1
            if [ ! -f saves/plus.rtl-sdr ]; then
                echo "NOT FOUND"
                echo "Installing RTL-SDR Drivers"
                sleep 1
                sudo apt install rtl-sdr -y
                echo "Installing udev rules"
                sudo cp rtl-sdr/10-rtl-sdr.rules /etc/udev/rules.d/ -v
                sudo udevadm control --reload-rules
                touch saves/plus.rtl-sdr
                echo "RTL-SDR Driver Installed"
            else
                echo "OK"
            fi
            ;;
        11)
            echo -n "Checking for RTL-SDR iGate..."
            sleep 1
            if [ ! -f saves/plus.sdr_igate ]; then
                echo "NOT FOUND"
                echo "Installing RTL-SDR iGate"
                sleep 1
                chmod +x launchers/direwolf.rtlsdr.sh
                sudo cp services/rtlsdr-igate.service /etc/systemd/system/ -v
                sudo systemctl daemon-reload
                touch saves/plus.sdr_igate
                echo "RTL-SDR iGate Installed"
            else
                echo "OK"
            fi
            ;;
    esac
done

bash build_menus.sh
echo "DigiPi Plus Install Complete. Please refresh your Homepage to view changes. Enjoy!"