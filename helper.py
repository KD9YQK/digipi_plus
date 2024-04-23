#!/bin/python

import os


path = "/etc/systemd/system"
no_change = ['autohotspot.service', 'digipi-boot.service', 'digipi-resolv.service', 'rigctld.service', 'webchat.service',  'gpio_redled.service', 'chronyd.service', 'dbus-fi.w1.wpa_supplicant1.service', 
             'dbus-org.bluez.service', 'dbus-org.freedesktop.Avahi.service', 'dbus-org.freedesktop.nm-dispatcher.service', 'dbus-org.freedesktop.timesync1.service' ]


def add_EXECSTARTPRE(new:str):
    for x in os.listdir(path):
        if x.endswith(".service"):
            if x in no_change:
                pass
            else:
                with open(f"{path}/{x}") as f_old, open(f"services/{x}", "w") as f_new:
                    for line in f_old:
                        if 'ExecStartPre=+systemctl stop' in line:
                            if new in line:
                                pass
                            else:
                                line = line.replace('stop', f'stop {new}')
                        f_new.write(line)
