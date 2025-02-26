#!/bin/python

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
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed openwebrx-digipi 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            f_new.write("#-- OpenWebRX  -------------------------------------------------\n\n"
                        "echo '<tr>';\n"
                        "$output = shell_exec('systemctl is-active openwebrx-digipi');\n"
                        "$output = chop($output);\n"
                         " if ($output == 'active')\n"
                         " {\n"
                         """    echo '<td bgcolor="lightgreen">';\n"""
                         "    $checked = 'checked';\n"
                            "}\n"
                          "elseif ($output == 'failed')\n"
                          "{\n"
                          """   echo '<td bgcolor="red">';\n"""
                          "   $checked = '';\n"
                          "}\n"
                          "else\n"
                          "{\n"
                          """   echo '<td bgcolor="lightgrey">';\n"""
                          "   $checked = '';\n"
                          "}\n"
                        "echo '</td>';\n"
                        "echo '<td>';\n"
                        "echo '<font size=+1>OpenWebRX+</font></td>';\n"
                        "echo '<td nowrap>';\n"
                        """echo '<form action="plus_menu.php" method="post">';\n"""
                        """echo '<label class="switch switch-light">';\n"""
                        """echo '  <input type="hidden" name="openwebrx" value="off">';\n"""
                        """echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='openwebrx' value='on'  $checked />";\n"""
                        """echo '  <span class="switch-label" ></span> ';\n"""
                        """echo '  <span class="switch-handle"></span> ';\n"""
                        "echo '</label>';\n"
                        "echo '</form>';\n"
                        "echo '</font>';\n"
                        "echo '</td></tr>';\n")


with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row1 -->" in line:
            f_new.write("""  <td width="100px"><script language="JavaScript">document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8073' + '" target="openwebrx" title="OpenWebRX"><strong>OpenWebRX</strong></a> ' );</script></td>\n""")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
