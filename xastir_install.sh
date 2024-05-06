sudo apt-get install build-essential -y
sudo apt-get install git autoconf automake xorg-dev graphicsmagick gv libmotif-dev libcurl4-openssl-dev -y
sudo apt-get install gpsman gpsmanshp libpcre3-dev libproj-dev libdb5.3-dev python-dev-is-python3 libax25-dev libwebp-dev -y
sudo apt-get install shapelib libshp-dev festival festival-dev libgeotiff-dev libwebp-dev libgraphicsmagick1-dev libpcre2-dev -y
sudo apt-get install xfonts-100dpi xfonts-75dpi -y
xset +fp /usr/share/fonts/X11/100dpi,/usr/share/fonts/X11/75dpi
git clone https://github.com/Xastir/Xastir.git
cd Xastir
./bootstrap.sh
mkdir build
cd build
../configure CPPFLAGS="-I/usr/include/geotiff"
make 
sudo make install
sudo chmod u+s /usr/local/bin/xastir
cd /home/pi/digipi_plus
sudo rm -r Xastir -v 
