#!/bin/python

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
            f_new.write("#-- VaraHF  -------------------------------------------------\n\n"
                        echo "<tr>";\n
                        $output = shell_exec('systemctl is-active varahf');\n
                        $output = chop($output);\n
                          if ($output == "active")\n
                          {\n
                             echo '<td bgcolor="lightgreen">';\n
                             $checked = "checked";\n
                          }\n
                          elseif ($output == "failed")\n
                          {\n
                             echo '<td bgcolor="red">';\n
                             $checked = "";\n
                          }\n
                          else\n
                          {\n
                             echo '<td bgcolor="lightgrey">';\n
                             $checked = "";\n
                          }
                        echo '</td>';\n
                        echo '<td>';\n
                        echo '<font size=+1>Vara HF</font></td>';\n
                        echo '<td nowrap>';\n
                        echo '<form action="plus_menu.php" method="post">';\n
                        echo '<label class="switch switch-light">';\n
                        echo '  <input type="hidden" name="varahf" value="off">';\n
                        echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='varahf' value='on'  $checked />";\n
                        echo '  <span class="switch-label" ></span> ';\n
                        echo '  <span class="switch-handle"></span> ';\n
                        echo '</label>';\n
                        echo '</form>';\n
                        echo '</font>';\n
                        echo '</td></tr>';\n)
            f_new.write("#-- VaraFM  -------------------------------------------------\n\n"
                        echo "<tr>";\n
                        $output = shell_exec('systemctl is-active varafm');\n
                        $output = chop($output);\n
                          if ($output == "active")\n
                          {\n
                             echo '<td bgcolor="lightgreen">';\n
                             $checked = "checked";\n
                          }\n
                          elseif ($output == "failed")\n
                          {\n
                             echo '<td bgcolor="red">';\n
                             $checked = "";\n
                          }\n
                          else\n
                          {\n
                             echo '<td bgcolor="lightgrey">';\n
                             $checked = "";\n
                          }
                        echo '</td>';\n
                        echo '<td>';\n
                        echo '<font size=+1>Vara FM</font></td>';\n
                        echo '<td nowrap>';\n
                        echo '<form action="plus_menu.php" method="post">';\n
                        echo '<label class="switch switch-light">';\n
                        echo '  <input type="hidden" name="varafm" value="off">';\n
                        echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='varafm' value='on'  $checked />";\n
                        echo '  <span class="switch-label" ></span> ';\n
                        echo '  <span class="switch-handle"></span> ';\n
                        echo '</label>';\n
                        echo '</form>';\n
                        echo '</font>';\n
                        echo '</td></tr>';\n)
          


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
