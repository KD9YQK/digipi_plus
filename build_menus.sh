#!/bin/bash
echo "Building Menus..."
cp www/plus_form.php.base www/plus_form.php
cp www/plus_services.php.base www/plus_services.php
cp www/plus_links.php.base www/plus_links.php
cp home/emwmrc_plus /home/pi/.emwmrc
echo "Base Menus Created"
if [ -f saves/plus.uhf ]; then
    python3 uhf_helper.py
    sudo cp temp/*.php www/
    sudo rm temp/*.php
    echo "UHF Upgrade added to Homepage Menu"
fi

if [ -f saves/plus.pcsi ]; then
    python3 pcsi_helper.py
    sudo cp temp/*.php www/
    sudo rm temp/*.php
    echo "PCSI Added to Homepage Menu"
    sudo sed -i '/DigiPi Plus/a \        "pcsiDesktop"               f.exec "python3 /home/pi/PCSI/pcsiDesktop.py &"' /home/pi/.emwmrc
    echo "PCSI Added to Desktop Menu"
fi

if [ -f saves/plus.gridtracker ]; then
    sudo sed -i '/DigiPi Plus/a \        "Grid Tracker"               f.exec "gridtracker &"' /home/pi/.emwmrc
    echo "Grid Tracker Added to Desktop Menu"
fi

if [ -f saves/plus.js8spotter ]; then
    sudo sed -i '/DigiPi Plus/a \        "JS8Spotter"               f.exec "cd /home/pi/digipi_plus/js8spotter && bin/python3 js8spotter.py &"' /home/pi/.emwmrc
    echo "JS8Spotter Added to Desktop Menu"
fi

if [ -f saves/plus.gpredict ]; then
    sudo sed -i '/DigiPi Plus/a \        "gPredict"               f.exec "gpredict &"' /home/pi/.emwmrc
    echo "gPredict Added to Desktop Menu"
fi

if [ -f saves/plus.xastir ]; then
    python3 xastir_helper.py
    sudo cp temp/*.php www/
    sudo rm temp/*.php
    echo "Xastir Added to Homepage Menu"
    sudo sed -i '/DigiPi Plus/a \        "Xastir"               f.exec "xastir &"' /home/pi/.emwmrc
    echo "Xastir Added to Desktop Menu"
fi

if [ -f saves/plus.tqsl ]; then
    sudo sed -i '/DigiPi Plus/a \        "Trusted QSL"               f.exec "tqsl &"' /home/pi/.emwmrc
    echo "Trusted QSL Added to Desktop Menu"
fi

if [ -f saves/plus.openwebrx ]; then
    python3 openwebrx_helper.py
    sudo mv temp/*.php www/
    echo "OpenWebRX+ Added to Homepage Menu"
fi

if [ -f saves/plus.sdr_igate ]; then
    python3 rtlsdr_helper.py
    sudo mv temp/*.php www/
    echo "RTL-SDR iGate Added to Homepage Menu"
fi

if [ -f saves/plus.hamdash ]; then
    python3 hamdash_helper.py
    sudo cp temp/*.php www/
    sudo rm temp/*.php
    echo "Ham Dash Added to Homepage Menu"
fi

if [ -f saves/plus.chirp ]; then
    sudo sed -i '/DigiPi Plus/a \        "Chirp-Next"               f.exec "~/.local/bin/chirp &"' /home/pi/.emwmrc
    echo "Chirp-Next Added to Desktop Menu"
fi

if [ -f saves/plus.flutils ]; then
    sudo sed -i '/DigiPi Plus/a \        "FLWrap"               f.exec "flwrap &"' /home/pi/.emwmrc
    echo "FLWrap Added to Desktop Menu"
    sudo sed -i '/DigiPi Plus/a \        "FLMsg"               f.exec "flmsg &"' /home/pi/.emwmrc
    echo "FLMsg Added to Desktop Menu"
    sudo sed -i '/DigiPi Plus/a \        "FLAmp"               f.exec "flamp &"' /home/pi/.emwmrc
    echo "FLAmp Added to Desktop Menu"
fi
