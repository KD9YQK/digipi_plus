#!/bin/python

import os


path = "/etc/systemd/system"
no_change = ['autohotspot.service', 'digipi-boot.service', 'digipi-resolv.service', 'rigctld.service', 'webchat.service',  'gpio_redled.service', 'chronyd.service', 'dbus-fi.w1.wpa_supplicant1.service', 
             'dbus-org.bluez.service', 'dbus-org.freedesktop.Avahi.service', 'dbus-org.freedesktop.nm-dispatcher.service', 'dbus-org.freedesktop.timesync1.service' ]


def add_service(service, name):
  retval = "if (isset($_POST['{}'])) {\n".format(name)
  retval +="  $submit = $_POST['{}'];\n".format(name)
  retval +="  if ( $submit == 'on' ) {\n"
  retval +="    $output = shell_exec('sudo systemctl start {}');\n".format(service)
  retval +="    echo $output;\n"
  retval +="  }\n"
  retval +="  if ( $submit == 'off' ) {\n"
  retval +="    $output = shell_exec('sudo systemctl stop {}');\n".format(service)
  retval +="    echo $output;\n"
  retval +="  }\n"
  retval +="}\n"
  return retval


def add_form(title, service, name):
  retval = "#-- {}  -------------------------------------------------\n\n".format(title)
  retval += "echo '<tr>';\n"
  retval +="$output = shell_exec('systemctl is-active {}');\n".format(service)
  retval +="$output = chop($output);\n"
  retval +="if ($output == 'active')\n"
  retval +="{\n"
  retval +="""  echo '<td bgcolor="lightgreen">';\n"""
  retval +="  $checked = 'checked';\n"
  retval +="}\n"
  retval +="elseif ($output == 'failed')\n"
  retval +="{\n"
  retval +="""  echo '<td bgcolor="red">';\n"""
  retval +="  $checked = '';\n"
  retval +="}\n"
  retval +="else\n"
  retval +="{\n"
  retval +="""  echo '<td bgcolor="lightgrey">';\n"""
  retval +="  $checked = '';\n"
  retval +="}\n"
  retval +="echo '</td>';\n"
  retval +="echo '<td>';\n"
  retval +="echo '<font size=+1>{}</font></td>';\n".format(title)
  retval +="echo '<td nowrap>';\n"
  retval +="""echo '<form action="plus_menu.php" method="post">';\n"""
  retval +="""echo '<label class="switch switch-light">';\n"""
  retval +="""echo '  <input type="hidden" name="{}" value="off">';\n""".format(name)
  retval +="""echo '  <input onChange="this.form.submit()" class="switch-input" type="checkbox" name="{}" value="on"  $checked />';\n""".format(name)
  retval +="""echo '  <span class="switch-label" ></span> ';\n"""
  retval +="""echo '  <span class="switch-handle"></span> ';\n"""
  retval +="echo '</label>';\n"
  retval +="echo '</form>';\n"
  retval +="echo '</font>';\n"
  retval +="""echo '</td></tr>';\n"""
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
