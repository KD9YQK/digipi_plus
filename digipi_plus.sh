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


if [ ! -f saves/plus.node ]; then
    options+=(1 "AX25 Node Upgrade" off)
else
    options+=(1 "AX25 Node Upgrade" on)
fi

if [ ! -f saves/plus.uhf ]; then
    options+=(2 "UHF 9600 Baud Upgrade" off)
fi

if [ ! -f saves/plus.pcsi ]; then
    options+=(3 "PCSI" off)
fi

if [ ! -f saves/plus.gridtracker ]; then
    options+=(4 "Grid Tracker" off)
fi

if [ ! -f saves/plus.js8spotter ]; then
    options+=(5 "JS8Spotter" off)
fi

if [ ! -f saves/plus.gpredict ]; then
    options+=(6 "gPredict" off)
fi

if [ ! -f saves/plus.xastir ]; then
    options+=(7 "Xastir" off)
fi

if [ ! -f saves/plus.tqsl ]; then
    options+=(8 "Trusted QSL" off)
fi

if [ ! -f saves/plus.openwebrx ]; then
    options+=(9 "OpenWebRX+" off)
fi

if [ ! -f saves/plus.rtlsdr ]; then
    options+=(10 "RTL-SDR Drivers" off)
fi

if [ ! -f saves/plus.sdr_igate ]; then
    options+=(11 "RTL-SDR iGate" off)
fi

#build dialogue box with menu options
cmd=(dialog --backtitle "DigiPi Plus" --checklist "Pick 1 or more options" 22 50 16)
choices=($("${cmd[@]}" "${options[@]}" 2>&1 1>/dev/tty))

for choice in "${choices[@]}"; do
    echo "$choice selected"
done
