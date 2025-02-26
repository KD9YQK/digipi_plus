#!/bin/python

from helper import add_EXECSTARTPRE
from helper import add_service add_form


with open("www/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            asv = add_service("uhf-tnc", "uhftnc")
            f_new.write(asv)
            asv = add_service("uhf-node", "uhfnode")
            f_new.write(asv)
        f_new.write(line)


with open("www/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed uhf-node 2> /dev/null');\n")
            f_new.write("$output = shell_exec('sudo systemctl reset-failed uhf-tnc 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            asm = add_form("Direwolf UHF TNC", "uhf-tnc", "uhftnc")
            f_new.write(asm)
            asm = add_form("Direwolf UHF TNC", "uhf-node", "uhfnode")
            f_new.write(asm)


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    add_EXECSTARTPRE('uhf-node')
    add_EXECSTARTPRE('uhf-tnc')
