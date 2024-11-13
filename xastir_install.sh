sudo apt install xastir -y
sudo mkdir /var/www/html/xastir -v
sudo cp www/xastir/index.php /var/www/html/xastir/ -v
sudo cp services/xastir.service /etc/systemd/system/ -v
ln -sf /home/pi/digipi_plus/launchers/xastir.sh /home/pi -v
