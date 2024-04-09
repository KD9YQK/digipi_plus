sudo wget -O - https://luarvique.github.io/ppa/openwebrx-plus.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/openwebrx-plus.gpg
sudo echo "deb [signed-by=/etc/apt/trusted.gpg.d/openwebrx-plus.gpg] https://luarvique.github.io/ppa/bookworm ./" > temp/openwebrx-plus.list
sudo mv temp/openwebrx-plus.list /etc/apt/sources.list.d/openwebrx-plus.list
sudo apt-get update
sudo apt-get install openwebrx -y
sudo systemctl disable openwebrx
sudo systemctl stop openwebrx
python3 openwebrx_helper.py
sudo mv temp/*.php /var/www/html/
