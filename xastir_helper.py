#!/bin/python

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
            f_new.write("#-- PCSI  -------------------------------------------------\n\n"
                        "echo '<tr>';\n"
                        "$output = shell_exec('systemctl is-active xastir');\n"
                        "#$output = str_replace('failed', 'inactive', $output);\n"
                        "$output = chop($output);\n"
                        "if ($output == 'active'){\n"
                        """  echo '<td bgcolor="lightgreen">';\n"""
                        "}\n"
                        "elseif ($output == 'failed'){\n"
                        """  echo '<td bgcolor="lightgreen">';}\n"""
                        "else{\n"
                        """  echo '<td bgcolor="lightgrey">';}\n"""
                        "echo '&nbsp;';\n"
                        "echo '</td><td>';\n"
                        "echo '<font size=+1>Xastir</font></td>';\n"
                        """echo '<td align="right" nowrap>';\n"""
                        """echo '<input type="submit" name="xastir" value="on"> ';\n"""
                        """echo '<input type="submit" name="xastir" value="off">';\n"""
                        "echo '</font>';\n"
                        "echo '</td></tr>';\n")


with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row1 -->" in line:
            f_new.write("  <td><a href='/xastir' target='xastir' title='Display Xastir Screen'><strong>Xastir</strong></a></td>\n")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
