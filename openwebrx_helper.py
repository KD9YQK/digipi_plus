#!/bin/python
from helper import add_service_menu


with open("www/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("if (isset($_POST['openwebrx'])) {\n"
                        "  $submit = $_POST['openwebrx'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start openwebrx-digipi');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop openwebrx-digipi');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
        f_new.write(line)


with open("www/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    asm = add_service_menu("OpenWebRX+", "openwebrx-digipi", "openwebrx")
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed openwebrx-digipi 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            f_new.write(asm)


with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row1 -->" in line:
            f_new.write("""  <td width="100px"><script language="JavaScript">document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8073' + '" target="openwebrx" title="OpenWebRX"><strong>OpenWebRX</strong></a> ' );</script></td>\n""")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
