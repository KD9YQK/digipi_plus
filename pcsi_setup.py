
with open("/var/www/html/index.php") as f_old, open("index.new.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        if "<?php" in line:
            script_count += 1

        if 'if (isset($_POST["sstv"])) {' in line:
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

        if '#-- JS8CALL' in line:
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

        if '<?php' in line:
            if script_count == 4:
                f_new.write("<tr>\n"
                            "  <td>\n"
                            "    <a href='/pcsi' target='pcsi' title='Display pcsiGUI screen'><strong>pcsiGUI</strong></a>\n"
                            "  </td>\n"
                            "</tr>\n")

        f_new.write(line)

        if "$output = shell_exec('sudo systemctl reset-failed js8call 2> /dev/null');" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed pcsi 2> /dev/null');\n")

    f_new.close()
    f_old.close()

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
