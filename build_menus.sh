#!/bin/bash
echo "Building Menus..."

cp www/plus_form.php.base www/plus_form.php -v
cp www/plus_services.php.base www/plus_services.php -v
cp www/plus_links.php.base www/plus_links.php -v
cp home/emwmrc_plus /home/pi/.emwmrc

if [ -f saves/plus.uhf ]; then
    echo "UHF Upgrade added to Homepage Menu"
    python3 uhf_helper.py
    sudo cp temp/*.php www/ -v
    sudo rm temp/*.php -v
fi

if [ -f saves/plus.pcsi ]; then
    echo "PCSI Added to Homepage Menu"
    python3 pcsi_helper.py
    sudo cp temp/*.php www/ -v
    sudo rm temp/*.php -v
    echo "PCSI Added to GUI Menu"
    sudo sed -i '/DigiPi Plus/a \        "pcsiGUI"               f.exec "python3 /home/pi/PCSI/pcsiGUI.py &"' /home/pi/.emwmrc
fi

if [ -f saves/plus.gridtracker ]; then
    echo "Grid Tracker Added to GUI Menu"
    sudo sed -i '/DigiPi Plus/a \        "Grid Tracker"               f.exec "gridtracker &"' /home/pi/.emwmrc
fi

if [ -f saves/plus.js8spotter ]; then
    echo "JS8Spotter Added to GUI Menu"
    sudo sed -i '/DigiPi Plus/a \        "JS8Spotter"               f.exec "cd /home/pi/digipi_plus/js8spotter && python3 js8spotter.py &"' /home/pi/.emwmrc
fi

if [ -f saves/plus.gpredict ]; then
    echo "gPredict Added to GUI Menu"
    sudo sed -i '/DigiPi Plus/a \        "gPredict"               f.exec "gpredict &"' /home/pi/.emwmrc
fi

if [ -f saves/plus.xastir ]; then
    echo "Xastir Added to GUI Menu"
    sudo sed -i '/DigiPi Plus/a \        "Xastir"               f.exec "xastir &"' /home/pi/.emwmrc
fi

if [ -f saves/plus.tqsl ]; then
    echo "Trusted QSL Added to GUI Menu"
    sudo sed -i '/DigiPi Plus/a \        "Trusted QSL"               f.exec "tqsl &"' /home/pi/.emwmrc
fi

if [ -f saves/plus.openwebrx ]; then
    echo "OpenWebRX+ Added to Homepage Menu"
    python3 openwebrx_helper.py
    sudo mv temp/*.php www/
fi

if [ -f saves/plus.sdr_igate ]; then
    echo "RTL-SDR iGate Added to Homepage Menu"
    python3 rtlsdr_helper.py
    sudo mv temp/*.php www/ -v
fi
