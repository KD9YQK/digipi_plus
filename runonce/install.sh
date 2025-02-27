#!/bin/sh
sudo mkdir -p /etc/local/runonce.d/ran
sudo cp runonce /usr/local/bin/runonce
sudo chmod +x /usr/local/bin/runonce
#sudo cp runonce.service /etc/systemd/system/runonce.service
#sudo systemctl enable runonce.service
#sudo systemctl start runonce.service

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "@reboot /bin/bash /usr/local/bin/runonce" >> mycron
#install new cron file
crontab mycron
rm mycron
