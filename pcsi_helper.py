#!/bin/python

from helper import add_EXECSTARTPRE
from helper import add_form
from helper import add_service


with open("www/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            asv = add_service("pcsi", "pcsi")
            f_new.write(asv)
        f_new.write(line)


with open("www/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed pcsi 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            asm = add_form("PCSI", "pcsi", "pcsi")
            f_new.write(asm)


with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row1 -->" in line:
            f_new.write("  <td><a href='/pcsi' target='pcsi' title='Display pcsiGUI screen'><strong>pcsiGUI</strong></a></td>\n")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
