#!/bin/python

with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row2 -->" in line:
            f_new.write("""  <td width="100px"><script language="JavaScript">document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8073' + '" target="mmbr" title="MMBR - Messages Must Be Received"><strong>MMBR</strong></a> ' );</script></td>\n""")



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
