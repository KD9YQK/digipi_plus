#!/bin/bash

# check if .list file already exists
if [ -f /etc/apt/sources.list.d/box86.list ]; then
  sudo rm -f /etc/apt/sources.list.d/box86.list || exit 1
fi
# check if .sources file already exists
if [ -f /etc/apt/sources.list.d/box86.sources ]; then
  sudo rm -f /etc/apt/sources.list.d/box86.sources || exit 1
fi
# download gpg key from specified url
if [ -f /usr/share/keyrings/box86-archive-keyring.gpg ]; then
  sudo rm -f /usr/share/keyrings/box86-archive-keyring.gpg
fi
sudo mkdir -p /usr/share/keyrings
wget -qO- "https://pi-apps-coders.github.io/box86-debs/KEY.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/box86-archive-keyring.gpg
# create .sources file
echo "Types: deb
URIs: https://Pi-Apps-Coders.github.io/box86-debs/debian
Suites: ./
Signed-By: /usr/share/keyrings/box86-archive-keyring.gpg" | sudo tee /etc/apt/sources.list.d/box86.sources >/dev/null

sudo apt update
if cat /proc/cpuinfo | grep -q aes; then
  echo "Installing the generic arm box86 build"
  sudo apt install box86-generic-arm cabextract p7zip-full -y
else
  echo "Installing the RPI4 tuned box86 build"
  sudo apt install box86-rpi4arm64 cabextract p7zip-full -y
fi
cd ~/digipi_plus/temp

version=9.17

box86 -v

# Extract wine to /opt
wget https://github.com/Pi-Apps-Coders/files/releases/download/large-files/wine-i386-${version}.tar.gz -O wine-${version}.tar.gz
sudo tar -xvf wine-${version}.tar.gz -C /opt
rm wine-${version}.tar.gz

#edit wine.inf to disable mime-associations. Nobody wants to double-click a text file, wonder why nothing is happening, then watch 15 Wine notepad windows pop up. Ask me how I know.
sudo sed -i 's/winemenubuilder.exe -a -r/winemenubuilder.exe -r/' /opt/wine-${version}/share/wine/wine.inf #See: https://askubuntu.com/a/400430

wget -O winetricks "https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"
sudo mv winetricks /opt/wine-${version}/bin/winetricks
sudo chmod +x /opt/wine-${version}/bin/winetricks

#download Mono to universal location (to be installed automatically in all wine prefixes)
#according to https://wiki.winehq.org/Mono#Versions, use Mono 9.3.0 for Wine 9.17
#wine mono pacakge is called -x86 but contains both x86 and x86_64 binaries
sudo mkdir -p /opt/wine-${version}/share/wine/mono
wget -O "wine-mono-9.3.0-x86.tar.xz" 'https://dl.winehq.org/wine/wine-mono/9.3.0/wine-mono-9.3.0-x86.tar.xz'
echo "Extracting: /tmp/wine-mono-9.3.0-x86.tar.xz"
sudo tar -xvf "wine-mono-9.3.0-x86.tar.xz" -C "/opt/wine-${version}/share/wine/mono"
rm -f "wine-mono-9.3.0-x86.tar.xz"

#download Gecko to universal location (to be installed automatically in all wine prefixes)
#according to https://wiki.winehq.org/Gecko, use Gecko 2.47.4 for Wine 8.6
sudo mkdir -p /opt/wine-${version}/share/wine/gecko
wget -O "wine-gecko-2.47.4-x86.tar.xz" 'https://dl.winehq.org/wine/wine-gecko/2.47.4/wine-gecko-2.47.4-x86.tar.xz'
echo "Extracting: /tmp/wine-gecko-2.47.4-x86.tar.xz"
sudo tar -xvf "wine-gecko-2.47.4-x86.tar.xz" -C "/opt/wine-${version}/share/wine/gecko"
rm -f "wine-gecko-2.47.4-x86.tar.xz"

echo "Creating terminal commands:"
echo "  - winecfg"
sudo ln -s /opt/wine-${version}/bin/winecfg /usr/local/bin/winecfg
echo "  - wineserver"
sudo ln -s /opt/wine-${version}/bin/wineserver /usr/local/bin/wineserver
echo "  - wineboot"
sudo ln -s /opt/wine-${version}/bin/wineboot /usr/local/bin/wineboot

echo "  - wine"
echo "#!/bin/bash
if [ -d /opt/wine-${version}/mesa ];then
  export LD_LIBRARY_PATH=/opt/wine-${version}/mesa/lib/arm-linux-gnueabihf/
  export LIBGL_DRIVERS_PATH=/opt/wine-${version}/mesa/lib/arm-linux-gnueabihf/dri/
  export VK_ICD_FILENAMES=/opt/wine-${version}/mesa/share/vulkan/icd.d/broadcom_icd.armv7l.json
fi
/opt/wine-${version}/bin/wine"' "$@"' | sudo tee /usr/local/bin/wine >/dev/null

echo "  - winetricks"
echo "#!/bin/bash
BOX86_NOBANNER=1 /opt/wine-${version}/bin/winetricks"' "$@"' | sudo tee /usr/local/bin/winetricks >/dev/null

#make them all executable
echo -n "Making executable... "
sudo chmod +x /usr/local/bin/winecfg /usr/local/bin/wineserver /usr/local/bin/wineboot /usr/local/bin/wine /usr/local/bin/winetricks
echo "Done"

#get mesa and icons from wine-stuff repo
rm -rf wine-stuff
git clone https://github.com/Botspot/wine-stuff
sudo mv "wine-stuff/icons" /opt/wine-${version}
sudo mv "wine-stuff/Windows_10.msstyles" /opt/wine-${version}
if [ $(ldd --version | head -n1 | awk '{print $NF}' | sed 's/\..*//g') -ge 2 ] && [ "$(ldd --version | head -n1 | awk '{print $NF}' | sed 's/.*\.//g')" -ge 30 ] && ! package_is_new_enough libgl1-mesa-dri 22.1.0 ;then
  #only install mesa if glibc is 2.30 or greater and apt mesa version is less than 22.1.0 (which is the version of the binary builds)
  sudo mv "wine-stuff/mesa" /opt/wine-${version}
fi
sudo chown -R root:root /opt/wine-${version}
rm -rf wine-stuff

#remove old local menu launchers
rm -f ~/.local/share/applications/wine-config.desktop ~/.local/share/applications/wine-tricks.desktop ~/.local/share/applications/wine-explorer.desktop ~/.local/share/applications/wine-uninstaller.desktop ~/.local/share/applications/wine-taskmgr.desktop ~/.local/share/applications/wine-killer.desktop ~/.local/share/applications/wine-regenerate.desktop

#Remove wine auto-generated desktop files that handle mimetypes. Nobody in their right mind would want this.
#See: https://askubuntu.com/a/400430
rm -f ~/.local/share/mime/packages/x-wine*
rm -f ~/.local/share/applications/wine-extension*
rm -f ~/.local/share/icons/hicolor/*/*/application-x-wine-extension*
rm -f ~/.local/share/mime/application/x-wine-extension*

cd ~
wget "https://kd9yqk.com/downloads/vara_wine.zip"
unzip vara_wine.zip
rm vara_wine.zip
exit 0
