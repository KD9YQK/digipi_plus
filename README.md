# DigiPi Plus
## Add additional functionality to KM6LYW DigiPi

You can find the DigiPi image here https://digipi.org/

**DON'T install until AFTER initial setup of DigiPi!!! This only works for DigiPi version 1.8-2**

### Install
```
sudo remount
cd ~
git clone https://github.com/KD9YQK/digipi_plus.git
cd digipi_plus
```


### AX25 Packet Node addons
1) Adds Hunt the Wumpus game
2) Adds Go Fish game
```
cd ~/digipi_plus
bash node_upgrade.sh
```


### Add PCSI - Packet Compressed Sensing Imaging
```
cd ~/digipi_plus
bash pcsi_install.sh
```
More info about PCSI can be found here https://github.com/maqifrnswa/PCSI
