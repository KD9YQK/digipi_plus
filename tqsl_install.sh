sudo apt install cmake libssl-dev libsqlite3-dev libcurl4-openssl-dev libwxgtk3.0-gtk3-dev -y
wget http://www.arrl.org/files/file/LoTW%20Instructions/tqsl-2.7.3.tar.gz
tar -zxvf tqsl-2.7.3.tar.gz
cd tqsl-2.7.3
cmake .
make
sudo make install
sudo cp /usr/local/lib/libtqsllib.so /usr/lib/libtqsllib.so -v
sudo sed -i '/DigiPi Plus/a \        "Trusted QSL"               f.exec "tqsl &"' /home/pi/.emwmrc
cd ..
