#!/bin/python

with open("www/plus_links.php") as f_old, open("temp/plus_links.php", "w") as f_new:
    script_count = 0
    for line in f_old:
        f_new.write(line)
        if "<!-- Row2 -->" in line:
            f_new.write("  <td><a href='/hamdashboard/hamdash.html' target='hamdash' title='Display Ham Dash'><strong>Ham Dash</strong></a></td>\n")


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    pass
