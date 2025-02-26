#!/bin/python

from helper import add_service_menu
from helper import add_EXECSTARTPRE


with open("www/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("if (isset($_POST['varahf'])) {\n"
                        "  $submit = $_POST['varahf'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start varahf');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop varahf');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
            f_new.write("if (isset($_POST['varafm'])) {\n"
                        "  $submit = $_POST['varafm'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start varafm');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop varafm');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
        f_new.write(line)


with open("www/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed varahf 2> /dev/null');\n")
            f_new.write("$output = shell_exec('sudo systemctl reset-failed varafm 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            asm = add_service_menu("Vara HF", "varahf", "varahf")
            f_new.write(asm)
            asm = add_service_menu("Vara FM", "varafm", "varafm")
            f_new.write(asm)
          


with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row3 -->" in line:
            f_new.write("  <td><a href='/vara' target='vara' title='Display VaraHF screen'><strong>VaraHF</strong></a></td>\n")
            f_new.write("  <td><a href='/vara' target='vara' title='Display VaraFM screen'><strong>VaraFM</strong></a></td>\n")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
