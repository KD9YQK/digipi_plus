from helper import add_EXECSTARTPRE


with open("/var/www/html/plus_submit.php") as f_old, open("temp/plus_submit.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("if (isset($_POST['pcsi'])) {\n"
                        "  $submit = $_POST['pcsi'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start pcsi');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop pcsi');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
        f_new.write(line)


with open("/var/www/html/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed pcsi 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            f_new.write("#-- PCSI  -------------------------------------------------\n\n"
                        "echo '<tr>';\n"
                        "$output = shell_exec('systemctl is-active pcsi');\n"
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
                        "echo '<font size=+1>PCSI</font></td>';\n"
                        """echo '<td align="right" nowrap>';\n"""
                        """echo '<input type="submit" name="pcsi" value="on"> ';\n"""
                        """echo '<input type="submit" name="pcsi" value="off">';\n"""
                        "echo '</font>';\n"
                        "echo '</td></tr>';\n")


with open("/var/www/html/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row1 -->" in line:
            f_new.write("  <td><a href='/pcsi' target='pcsi' title='Display pcsiGUI screen'><strong>pcsiGUI</strong></a></td>\n")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    add_EXECSTARTPRE('pcsi')
