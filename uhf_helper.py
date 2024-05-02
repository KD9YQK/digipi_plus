#!/bin/python

from helper import add_EXECSTARTPRE


with open("www/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("if (isset($_POST['uhftnc'])) {\n"
                        "  $submit = $_POST['uhftnc'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start direwolf.uhf-tnc');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop direwolf.uhf-tnc');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
            f_new.write("if (isset($_POST['uhfnode'])) {\n"
                        "  $submit = $_POST['uhfnode'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start direwolf.uhf-node');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop direwolf.uhf-node');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
        f_new.write(line)


with open("www/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed direwolf.uhf-node 2> /dev/null');\n")
            f_new.write("$output = shell_exec('sudo systemctl reset-failed direwolf.uhf-tnc 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            f_new.write("#-- Direwolf UHF TNC  -------------------------------------------------\n\n"
                        "echo '<tr>';\n"
                        "$output = shell_exec('systemctl is-active direwolf.uhf-tnc');\n"
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
                        "echo '<font size=+1>UHF TNC</font></td>';\n"
                        """echo '<td align="right" nowrap>';\n"""
                        """echo '<input type="submit" name="uhftnc" value="on"> ';\n"""
                        """echo '<input type="submit" name="uhftnc" value="off">';\n"""
                        "echo '</font>';\n"
                        "echo '</td></tr>';\n")
            f_new.write("#-- Direwolf UHF NODE  -------------------------------------------------\n\n"
                        "echo '<tr>';\n"
                        "$output = shell_exec('systemctl is-active direwolf.uhf-node');\n"
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
                        "echo '<font size=+1>UHF Node</font></td>';\n"
                        """echo '<td align="right" nowrap>';\n"""
                        """echo '<input type="submit" name="uhfnode" value="on"> ';\n"""
                        """echo '<input type="submit" name="uhfnode" value="off">';\n"""
                        "echo '</font>';\n"
                        "echo '</td></tr>';\n")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    add_EXECSTARTPRE('direwolf.uhf-node')
    add_EXECSTARTPRE('direwolf.uhf-tnc')
