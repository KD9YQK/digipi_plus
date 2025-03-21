#!/bin/bash

echo ""
echo "DigiPi Plus Installer"
echo "Created by Bob - KD9YQK"
echo ""
sleep 2
do_reboot=false
sudo remount
sudo apt update
echo ""
echo -n "Checking for DigiPi Plus Base..."
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
    touch saves/plus.base
    echo 'Installing runonce by KD9YQK'
    cd ~/digipi_plus/runonce
    bash install.sh
    cd ~/digipi_plus
    sudo apt install dialog
    if dialog --stdout --title "Expand Filesystem" --backtitle "Digipi Plus" --yesno "Would you like to expand the filesystem to use all available space on the SD-Card?" 7 60; then
        sudo remount 
        echo "- +" | sudo sfdisk -N2 --no-reread --force /dev/mmcblk0 # one liner magic to resize partition table
        sudo partprobe # reloads the new table
        sudo resize2fs /dev/mmcblk0p2 # expands disk to use new table
        sudo partprobe # reloads the new table
    fi
    if dialog --stdout --title "Xterm Colors" --backtitle "Digipi Plus" --yesno "Would you like to swap Xterm colors for better visability?" 7 60; then
        echo 'xterm*Background: black' >> ~/.Xresources
        echo 'xterm*Foreground: white' >> ~/.Xresources
        xrdb -merge ~/.Xresources
    fi
    echo "DigiPi Plus Base Installed"
else
    echo "OK"
fi

echo "Creating Simlinks"
sudo ln -sf /home/pi/digipi_plus/www/*.php /var/www/html/ -v
sudo ln -sf /home/pi/digipi_plus/www/*.css /var/www/html/styles -v
sudo ln -sf /home/pi/digipi_plus/www/help/ /var/www/html -v
sudo ln -sf /home/pi/digipi_plus/www/images/ /var/www/html/images -v

Max_RAM(){
    free | awk 'NR==2 {print $2}'
}

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

if (($(Max_RAM) > 1000000)); then
    if [ ! -f saves/plus.gridtracker ]; then
        options+=(4 "Grid Tracker" off)
    else
        installed+="Grid Tracker, "
    fi
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

if [ ! -f saves/plus.hamdash ]; then
    options+=(12 "Ham Dash" off)
else
    installed+="Ham Dash, "
fi

if [ ! -f saves/plus.chirp ]; then
    options+=(13 "Chirp-Next" off)
else
    installed+="Chirp-Next, "
fi

if [ ! -f saves/plus.mmbr ]; then
    options+=(14 "MMBR - Messages Must Be Received" off)
else
    installed+="MMBR, "
fi

if [ ! -f saves/plus.flutils ]; then
    options+=(15 "FL Utils - FLAmp, FLMsg, FLWrap" off)
else
    installed+="FL Utils, "
fi

if (($(Max_RAM) > 1000000)); then
    if [ ! -f saves/plus.vara ]; then
        options+=(16 "VARA - VaraHF and VaraVHF" off)
    else
        installed+="VARA, "
    fi
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
                echo "Upgrading AX25 packet node"
                echo "Backing up /etc/ax25/uronode.conf as /etc/ax25/uronode.conf.bak"
                sudo cp /etc/ax25/uronode.conf /etc/ax25/uronode.conf.bak -v

                echo "Backing up /etc/ax25/uronode.motd as /etc/ax25/uronode.motd.bak"
                sudo cp /etc/ax25/uronode.motd /etc/ax25/uronode.motd.bak -v
                touch saves/plus.node
                echo "AX25 Upgrade Installed. The Node Upgrade Installer will run towards the end of this script."
            else
                echo "OK"
            fi
            ;;
    esac
done

if [ ! -f saves/plus.node ]; then
    echo "Skipping AX25 Node Upgrade"
else
    echo "Starting AX25 Node Upgrade"
    sleep 1
    bash node_upgrade.sh
fi

for choice in "${choices[@]}"; do
    case $choice in
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
                sudo pip install simpleaudio
                wget https://kf7mix.com/files/js8spotter/js8spotter-110b_src.zip
                mkdir js8spotter
                unzip js8spotter-110b_src.zip
                cp -r js8spotter-110b_src/* js8spotter/
                rm -r js8spotter-110b_src
                rm js8spotter-110b_src.zip
                sudo apt install python3-tk python3-pil python3-pil.imagetk -y
                python3 -m venv --system-site-packages js8spotter
                js8spotter/bin/pip install simpleaudio
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
                cp launchers/direwolf.rtlsdr.sh ~/
                chmod +x ~/direwolf.rtlsdr.sh
                sudo cp services/rtlsdr-igate.service /etc/systemd/system/ -v
                sudo systemctl daemon-reload
                touch saves/plus.sdr_igate
                echo "RTL-SDR iGate Installed"
            else
                echo "OK"
            fi
            ;;
        12)
            echo -n "Checking for Ham Dash..."
            sleep 1
            if [ ! -f saves/plus.hamdash ]; then
                echo "NOT FOUND"
                echo "Installing Ham Dash"
                sleep 1
                git clone https://github.com/VA3HDL/hamdashboard.git
                sudo ln -sf /home/pi/digipi_plus/hamdashboard/ /var/www/html -v
                touch saves/plus.hamdash
                echo "Ham Dash Installed"
            else
                echo "OK"
            fi
            ;;
        13)
            echo -n "Checking for Chirp-Next..."
            sleep 1
            if [ ! -f saves/plus.chirp ]; then
                echo "NOT FOUND"
                echo "Installing Chirp-Next"
                sleep 1
                cd ~/digipi_plus/temp
                sudo apt install python3-wxgtk4.0 pipx -y
                wget https://archive.chirpmyradio.com/chirp_next/next-20250221/chirp-20250221-py3-none-any.whl
                pipx install --system-site-packages ./chirp-20250221-py3-none-any.whl
                pipx ensurepath
                cd ~/digipi_plus
                touch saves/plus.chirp
                echo "Chirp-Next Installed"
            else
                echo "OK"
            fi
            ;;
        14)
            echo -n "Checking for MMBR..."
            sleep 1
            if [ ! -f saves/plus.mmbr ]; then
                echo "NOT FOUND"
                echo "Installing MMBR"
                sleep 1
                git clone https://github.com/KD9YQK/ham-microblog.git
                cd ham-microblog
                python -m venv venv
                cd ~/digipi_plus
                TMPDIR=/home/pi/tmp venv/bin/pip3 install -r requirements.txt
                sudo cp services/mmbr.service /etc/systemd/system/ -v
                ln -sf /home/pi/digipi_plus/launchers/mmbr.sh /home/pi -v
                sudo systemctl daemon-reload
                sudo systmctl enable mmbr
                sudo systmctl start mmbr
                cd ~/digipi_plus
                touch saves/plus.mmbr
                echo "MMBR Installed"
            else
                echo "OK"
            fi
            ;;
        15)
            echo -n "Checking for FL Utils..."
            sleep 1
            if [ ! -f saves/plus.flutils ]; then
                echo "NOT FOUND"
                echo "Installing FL Utils"
                sleep 1
                sudo apt install flamp flmsg flwrap
                touch saves/plus.flutils
                echo "FL Utils Installed"
            else
                echo "OK"
            fi
            ;;
        16)
            echo -n "Checking for VARA..."
            sleep 1
            if [ ! -f saves/plus.vara ]; then
                echo "NOT FOUND"
                echo "Installing VARA"
                sleep 1
                echo ''
                echo "Switch to 64bit kernel"
                echo "A reboot will be required when install is complete!"
                sleep 1
                if [ -f /boot/firmware/config.txt ]; then
                  boot_config="/boot/firmware/config.txt"
                elif [ -f /boot/config.txt ]; then
                  boot_config="/boot/config.txt"
                else
                  error 'User error: The /boot/config.txt and /boot/firmware/config.txt files are missing! You must be on an unsupported system.'
                fi
                echo "" | sudo tee --append $boot_config >/dev/null
                echo "arm_64bit=1" | sudo tee --append $boot_config >/dev/null
                bash vara/install.sh
                cd ~/digipi_plus
                echo "Creating alias for varahf"
                echo 'alias varahf="env WINEPREFIX=/home/pi/.wine WINEDEBUG=-all wine /home/pi/.wine/drive_c/VARA/VARA.exe"' >> ~/.bashrc
                echo "Creating alias for varafm"
                echo 'alias varafm="env WINEPREFIX=/home/pi/.wine WINEDEBUG=-all wine /home/pi/.wine/drive_c/VARAFM/VARAFM.exe"' >> ~/.bashrc
                
                sudo cp services/varahf.service /etc/systemd/system/ -v
                sudo cp services/varafm.service /etc/systemd/system/ -v
                ln -sf /home/pi/digipi_plus/launchers/varahf.sh /home/pi -v
                ln -sf /home/pi/digipi_plus/launchers/varafm.sh /home/pi -v
                #sudo systemctl daemon-reload
                touch saves/plus.vara
                do_reboot=true
                echo "VARA Pre-Install Complete.  Please reboot to continue!!!"
                sleep 3
            else
                echo "OK"
            fi
            ;;
    esac
done

chmod +x launchers/*.sh
bash build_services.sh
sudo systemctl daemon-reload
bash build_menus.sh
echo "DigiPi Plus Install Complete. Please refresh your Homepage with Ctrl+Shift+R to view changes. Enjoy!"
sleep 2
#if [ "$do_reboot" = true ] ; then
#    if dialog --stdout --title "Reboot Required" --backtitle "Digipi Plus" --yesno "Digipi requires a reboot.  Would you like to do it now?" 7 60; then
#        sudo shutdown now -r &
#    fi
#fi
