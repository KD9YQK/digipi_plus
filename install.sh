
echo ""
echo "DigiPi Plus Installer"
echo "Created by Bob - KD9YQK"
echo ""
sleep 1
echo -n "Checking for Base..."
sleep 1
if [ ! -f plus.base ]; then
    echo "NOT FOUND"
    echo "Installing DigiPi Plus Base"
    sleep 1
    echo "Backing up files"
    cp /var/www/html/index.php backup/ -v
    cp ~/.emwmrc backup/emwmrc -v
    cp /etc/systemd/system/*.service backup/ -v
    echo "Copying Files"
    sudo cp www/*.php /var/www/html/ -v
    cp home/emwmrc_plus ~/.emwmrc -v
    touch plus.base
    echo "DigiPi Plus Base Installed"
else
    echo "OK"
fi

echo -n "Checking for AX25 Upgrade..."
sleep 1
if [ ! -f plus.node ]; then
    echo "NOT FOUND"
    echo "Installing AX25 Node Upgrade"
    sleep 1
    bash node_upgrade.sh
    touch plus.node
    echo "AX25 Upgrade Installed"
else
    echo "OK"
fi

echo -n "Checking for PCSI..."
sleep 1
if [ ! -f plus.pcsi ]; then
    echo "NOT FOUND"
    echo "Installing PCSI"
    sleep 1
    bash pcsi_install.sh
    touch plus.pcsi
    echo "PCSI Installed"
else
    echo "OK"
fi

echo -n "Checking for RTL-SDR Drivers..."
sleep 1
if [ ! -f plus.rtl-sdr ]; then
    echo "NOT FOUND"
    echo "Installing RTL-SDR Drivers"
    sleep 1
    sudo apt install rtl-sdr -y
    echo "Installing udev rules"
    sudo cp rtl-sdr/10-rtl-sdr.rules /etc/udev/rules.d/ -v
    sudo udevadm control --reload-rules
    touch plus.rtl-sdr
    echo "RTL-SDR Driver Installed"
else
    echo "OK"
fi

echo -n "Checking for RTL-SDR iGate..."
sleep 1
if [ ! -f plus.sdr_igate ]; then
    echo "NOT FOUND"
    echo "Installing RTL-SDR iGate"
    sleep 1

    touch plus.sdr_igate
    echo "RTL-SDR iGate Installed"
else
    echo "OK"
fi


