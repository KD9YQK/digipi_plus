from helper import add_EXECSTARTPRE


with open("/home/pi/direwolf.tnc.conf") as f_old, open("/home/pi/digipi_plus/launchers/direwolf.rtlsdr.conf", "w") as f_new:
    f_new.write("ADEVICE null null\n")
    f_new.write("CHANNEL 0\n")
    for line in f_old:
        if "MYCALL" in line:
            f_new.write(line)
        elif "IGSERVER" in line:
            f_new.write(line)
        elif "IGLOGIN" in line:
            f_new.write(line)
        elif "sendto=IG" in line:
            f_new.write(line)


with open("/var/www/html/plus_services.php") as f_old, open("temp/plus_services.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("if (isset($_POST['rtlsdr-igate'])) {\n"
                        "  $submit = $_POST['rtlsdr-igate'];\n"
                        "  if ( $submit == 'on' ) {\n"
                        "    $output = shell_exec('sudo systemctl start rtlsdr-igate');\n"
                        "    sleep(5);\n"
                        "    echo $output;\n"
                        "  }\n"
                        "  if ( $submit == 'off' ) {\n"
                        "    $output = shell_exec('sudo systemctl stop rtlsdr-igate');\n"
                        "    echo $output;\n"
                        "  }\n"
                        "}\n")
        f_new.write(line)


with open("/var/www/html/plus_form.php") as f_old, open("temp/plus_form.php", "w") as f_new:
    for line in f_old:
        if "?>" in line:
            f_new.write("$output = shell_exec('sudo systemctl reset-failed rtlsdr-igate 2> /dev/null');\n")
    
        f_new.write(line)

        if "<?php" in line:
            f_new.write("#-- PCSI  -------------------------------------------------\n\n"
                        "echo '<tr>';\n"
                        "$output = shell_exec('systemctl is-active rtlsdr-igate');\n"
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
                        "echo '<font size=+1>RTL-SDR APRS iGate</font></td>';\n"
                        """echo '<td align="right" nowrap>';\n"""
                        """echo '<input type="submit" name="rtlsdr-igate" value="on"> ';\n"""
                        """echo '<input type="submit" name="rtlsdr-igate" value="off">';\n"""
                        "echo '</font>';\n"
                        "echo '</td></tr>';\n")



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    add_EXECSTARTPRE('rtlsdr-igate')
