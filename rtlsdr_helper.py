#!/bin/bash

from helper import add_EXECSTARTPRE
from helper import add_service add_form


with open("/home/pi/direwolf.tnc.conf") as f_old, open("/home/pi/digipi_plus/launchers/direwolf.rtlsdr.conf", "w") as f_new:
    f_new.write("ADEVICE null null\n")
    f_new.write("CHANNEL 0\n")
    for line in f_old:
        if "MYCALL" in line:
            f_new.write(line)
        elif "IGSERVER" in line:
            f_new.write(line)
        elif "IGLOGIN" in line:
            f_new.write(line)
        elif "sendto=IG" in line:
            f_new.write(line)


with open("www/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            asv = add_service("rtlsdr-igate", "rtlsdr-igate")
            f_new.write(asv)
        f_new.write(line)


with open("www/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed rtlsdr-igate 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            asm = add_form("RTL-SDR igate", "rtlsdr-igate", "rtlsdr-igate")
            f_new.write(asm)


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
