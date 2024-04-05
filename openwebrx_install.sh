sudo wget -O - https://luarvique.github.io/ppa/openwebrx-plus.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/openwebrx-plus.gpg
sudo echo "deb [signed-by=/etc/apt/trusted.gpg.d/openwebrx-plus.gpg] https://luarvique.github.io/ppa/bookworm ./" > /etc/apt/sources.list.d/openwebrx-plus.list
sudo apt-get update
sudo apt-get install openwebrx
