
echo ""
echo "DigiPi Plus Installer"
echo "Created by Bob - KD9YQK"
echo ""

echo "Checking for Base..." -n
if [ ! -f plus.base ]; then
    echo "NOT FOUND"
    echo "Installing DigiPi Plus Base"
    echo "Backing up files"
    cp /var/www/html/index.php backup/ -v
    cp ~/.emwmrc backup/emwmrc -v
    cp /etc/systemd/system/*.service backup/ -v
    echo "Copying Files"
    sudo cp www/*.php /var/www/html/ -v
    cp emwmrc.new ~/.emwmrc -v
    touch plus.base
    echo "DigiPi Plus Base Installed"
else
    echo "OK"
fi

echo "Checking for AX25 Upgrade..." -n
if [ ! -f plus.node ]; then
    echo "NOT FOUND"
    echo "Installing AX25 Node Upgrade"
    bash node_upgrade.sh
    touch plus.node
    echo "AX25 Upgrade Installed"
else
    echo "OK"
fi

echo "Checking for PCSI..." -n
if [ ! -f plus.pcsi ]; then
    echo "NOT FOUND"
    echo "Installing PCSI"
    bash pcsi_install.sh
    touch plus.pcsi
    echo "PCSI Installed"
else
    echo "OK"
fi

echo "Checking for RTL-SDR Drivers..." -n
if [ ! -f plus.rtl-sdr ]; then
    echo "NOT FOUND"
    echo "Installing RTL-SDR Drivers"
    sudo apt install rtl-sdr -y
    echo "Installing udev rules"
    sudo cp rtl-sdr/10-rtl-sdr.rules /etc/udev/rules.d/ -v
    sudo udevadm control --reload-rules
    touch plus.rtl-sdr
    echo "RTL-SDR Driver Installed"
else
    echo "OK"
fi

