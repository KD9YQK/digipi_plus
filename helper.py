#!/bin/python

import os


path = "/etc/systemd/system"
no_change = ['autohotspot.service', 'digipi-boot.service', 'digipi-resolv.service', 'rigctld.service', 'webchat.service',  'gpio_redled.service', 'chronyd.service', 'dbus-fi.w1.wpa_supplicant1.service', 
             'dbus-org.bluez.service', 'dbus-org.freedesktop.Avahi.service', 'dbus-org.freedesktop.nm-dispatcher.service', 'dbus-org.freedesktop.timesync1.service' ]


def asm(title, service, name):
    retval = """#-- {}  -------------------------------------------------\n\n
              echo '<tr>';\n
              $output = shell_exec('systemctl is-active {}');\n
              $output = chop($output);\n
              if ($output == 'active')\n
              {\n
              echo '<td bgcolor="lightgreen">';\n
              $checked = 'checked';\n
              }\n
              elseif ($output == 'failed')\n
              {\n
              echo '<td bgcolor="red">';\n
              $checked = '';\n
              }\n
              else\n
              {\n
              echo '<td bgcolor="lightgrey">';\n
              $checked = '';\n
              }\n
              echo '</td>';\n
              echo '<td>';\n
              echo '<font size=+1>{}</font></td>';\n
              echo '<td nowrap>';\n
              echo '<form action="plus_menu.php" method="post">';\n
              echo '<label class="switch switch-light">';\n
              echo '  <input type="hidden" name="{}" value="off">';\n
              echo '  <input onChange="this.form.submit()" class="switch-input" type="checkbox" name="{}" value="on"  $checked />';\n
              echo '  <span class="switch-label" ></span> ';\n
              echo '  <span class="switch-handle"></span> ';\n
              echo '</label>';\n
              echo '</form>';\n
              echo '</font>';\n
              echo '</td></tr>';\n""".format(title, service, title, name, name)
    return retval


def add_EXECSTARTPRE(new:str):
    for x in os.listdir(path):
        if x.endswith(".service"):
            if x in no_change:
                pass
            else:
                with open(f"{path}/{x}") as f_old, open(f"services/{x}", "w") as f_new:
                    for line in f_old:
                        if 'ExecStartPre=+systemctl stop' in line:
                            if new in line:
                                pass
                            else:
                                line = line.replace('stop', f'stop {new}')
                        f_new.write(line)

if __name__ == '__main__':
    import sys
    add_EXECSTARTPRE(sys.argv[1])
