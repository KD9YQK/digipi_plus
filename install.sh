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

echo -n "Checking for AX25 Upgrade..."
sleep 1
if [ ! -f saves/plus.node ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing AX25 Node Upgrade"
             sleep 1
             bash node_upgrade.sh
             touch saves/plus.node
             echo "AX25 Upgrade Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for PCSI..."
sleep 1
if [ ! -f saves/plus.pcsi ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing PCSI"
            sleep 1
            bash pcsi_install.sh
            touch saves/plus.pcsi
            echo "PCSI Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for Grid Tracker..."
sleep 1
if [ ! -f saves/plus.gridtracker ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing Grid Tracker"
            mkdir ~/Documents
            sleep 1
            curl  https://debian.gridtracker.org/gridtracker_deb_install.sh | sudo bash
            sudo apt update
            sudo apt install gridtracker -y
            sudo sed -i '/DigiPi Plus/a \        "Grid Tracker"               f.exec "gridtracker &"' /home/pi/.emwmrc
            touch saves/plus.gridtracker
            echo "Grid Tracker Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for JS8Spotter..."
sleep 1
if [ ! -f saves/plus.js8spotter ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing JS8Spotter"
            mkdir ~/Documents
            sleep 1
            wget https://kf7mix.com/files/js8spotter/js8spotter-110b_src.zip
            mkdir js8spotter
            unzip js8spotter-110b_src.zip
            mv -R js8spotter-110b_src/ js8spotter/
            rm js8spotter-110b_src
            sudo sed -i '/DigiPi Plus/a \        "JS8Spotter"               f.exec "/home/pi/digipi_plus/js8spotter/JS8Spotter &"' /home/pi/.emwmrc
            touch saves/plus.js8spotter
            echo "JS8Spotter Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for Xastir..."
sleep 1
if [ ! -f saves/plus.xastir ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing Xastir"
            sleep 1
            bash xastir_install.sh
            touch saves/plus.xastir
            echo "Xastir Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for Trusted QSL..."
sleep 1
if [ ! -f saves/plus.tqsl ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing Trusted QSL"
            sleep 1
            bash tqsl_install.sh
            touch saves/plus.tqsl
            echo "Trusted QSL Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for CHIRP..."
sleep 1
if [ ! -f saves/plus.chirp ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing CHIRP"
            sleep 1
            bash chirp_install.sh
            touch saves/plus.chirp
            echo "CHIRP Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for OpenWebRX..."
sleep 1
if [ ! -f saves/plus.openwebrx ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing OpenWebRX"
            sleep 1
            bash openwebrx_install.sh
            touch saves/plus.openwebrx
            echo "OpenWebRX Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for RTL-SDR Drivers..."
sleep 1
if [ ! -f saves/plus.rtl-sdr ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing RTL-SDR Drivers"
            sleep 1
            sudo apt install rtl-sdr -y
            echo "Installing udev rules"
            sudo cp rtl-sdr/10-rtl-sdr.rules /etc/udev/rules.d/ -v
            sudo udevadm control --reload-rules
            touch saves/plus.rtl-sdr
            echo "RTL-SDR Driver Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi

echo -n "Checking for RTL-SDR iGate..."
sleep 1
if [ ! -f saves/plus.sdr_igate ]; then
    echo "NOT FOUND"
    read -p "Do you want to install? (y/n) " yn
    case $yn in
        [yY] ) echo "Installing RTL-SDR iGate"
            sleep 1
            chmod +x launchers/direwolf.rtlsdr.sh
            python3 rtlsdr_helper.py
            sudo mv temp/*.php www/ -v
            sudo cp services/rtlsdr-igate.service /etc/systemd/system/ -v
            sudo systemctl daemon-reload
            touch saves/plus.sdr_igate
            echo "RTL-SDR iGate Installed";;
        * ) echo "Skipping";;
    esac
else
    echo "OK"
fi
