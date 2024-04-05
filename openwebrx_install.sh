sudo wget -O /usr/share/keyrings/openwebrx.gpg https://repo.openwebrx.de/openwebrx.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/openwebrx.gpg] https://repo.openwebrx.de/debian/ experimental main" > temp/openwebrx-experimental.list
sudo mv temp/openwebrx-experimental.list /etc/apt/sources.list.d/openwebrx-experimental.list
sudo apt-get update
sudo apt-get install openwebrx
