
<form action="index.php" method="post">
<table>
<tr>
    <td>
        <center><?php include 'header.php' ?></center>
        <div class="tab" style="text-align: center; width:400px;">
            <button class="tablinks" type="button" id="defaultOpen" onclick="openMenu(event, 'Services')">Services</button>
            <button class="tablinks" type="button" onclick="openMenu(event, 'Programs')">Programs</button>
            <button class="tablinks" type="button" onclick="openMenu(event, 'Settings')">Settings</button>
            <button class="tablinks" type="button" onclick="openMenu(event, 'Direwatch')">Direwatch</button>
        </div>
        <div id="Services" class="tabcontent">
            <?php include 'orig_services.php' ?>
            <?php include 'orig_form.php' ?>
            <?php include 'plus_services.php' ?>
            <?php include 'plus_form.php' ?>
        </div>

        <div id="Programs" class="tabcontent">
            <?php include 'orig_links.php' ?>
            <?php include 'plus_links.php' ?>
        </div>

        <div id="Settings" class="tabcontent">
            <?php include 'plus_settings.php' ?>
        </div>
        <div id="Direwatch" class="tabcontent">
            <?php include 'direwatch.php' ?>
        </div>
    </td>
    <td style="width:100%;">
        <iframe src="syslog.php" name="iframe_a" style="height:90vh; width:100%;" title="Digipi Plus"></iframe>
    </td>
</tr>
</table>

<div id="mySidenav" class="sidenav">
    <a href="syslog.php" target='iframe_a' id="syslog">SysLog</a>
    <a href="log.php" target='iframe_a' id="pktlog">PktLog</a>
    <a href="shell.php" target='iframe_a' id="shell">Shell</a>
    <script>
        document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':6080/vnc.html?port=6080&password=test11&autoconnect=true" target="iframe_a" id="vnc">VNC</a>' )
    </script>
</div>

<script>
function openMenu(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

<small>1.8-2 KM6LYW ©2024</small>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/dot"><font size="+3" color="#eeeeee">.</font></a>
</form>
</font>
</body>
</html>
