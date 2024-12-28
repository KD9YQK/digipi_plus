#!/bin/bash -x
sudo remount
cd /home/pi/digipi_plus/ham-microblog
venv/bin/python daemon.py

exit 0
