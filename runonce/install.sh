#!/bin/sh
# Place any script you want run at the next reboot (once only) in the directory /etc/local/runonce.d and chown and chmod +x it appropriately. 
# Once it's been run, you'll find it moved to the ran subdirectory and the date and time appended to its name. 
# There will also be an entry in your syslog.

sudo mkdir -p /etc/local/runonce.d/ran
sudo chown -R pi /etc/local/runonce.d/
sudo cp runonce /usr/local/bin/runonce
sudo chmod +x /usr/local/bin/runonce
#sudo cp runonce.service /etc/systemd/system/runonce.service
#sudo systemctl enable runonce.service
#sudo systemctl start runonce.service

#write out current crontab
test=$(crontab -l) >> /dev/null
if [ -z $test ] ; then
  echo "@reboot /bin/bash /usr/local/bin/runonce  2>&1 | logger -t runonce" > mycron
else
  crontab -l > mycron
  echo "" >> mycron
  echo "@reboot /bin/bash /usr/local/bin/runonce  2>&1 | logger -t runonce" >> mycron
fi
#install new cron file
crontab mycron
rm mycron
