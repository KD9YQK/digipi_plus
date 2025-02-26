#!/bin/python
from helper import add_service_menu
from helper import add_EXECSTARTPRE


with open("www/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("if (isset($_POST['xastir'])) {\n"
                        "  $submit = $_POST['xastir'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start xastir');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop xastir');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
        f_new.write(line)


with open("www/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed xastir 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            asm = add_service_menu("Xastir", "xastir", "xastir")
            f_new.write(asm)


with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row1 -->" in line:
            f_new.write("  <td><a href='/xastir' target='xastir' title='Display Xastir Screen'><strong>Xastir</strong></a></td>\n")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
