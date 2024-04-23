<table class="center"><tr><td>
<?php include 'header.php' ?>
</td></tr></table>

<form action="index_plus.php" method="post">
<table>
<tr>
    <td>
        <div class="tab" style="text-align: center; width:300px;">
            <center>
            <button class="tablinks" type="button" id="defaultOpen" onclick="openMenu(event, 'Services')">Services</button>
            <button class="tablinks" type="button" onclick="openMenu(event, 'Programs')">Programs</button>
            <button class="tablinks" type="button" onclick="openMenu(event, 'Settings')">Settings</button>
            </center>
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
    </td>
    <td style="width:100%;">
        <iframe src="syslog.php" name="iframe_a" style="height:90vh; width:100%;" title="Digipi Plus"></iframe>
    </td>
</tr>
</table>

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

<br/><br/><hr>
<small>1.8-2 KM6LYW ©2024</small>

<br/><br/>
<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/dot"><font size="+3" color="#eeeeee">.</font></a>

</form>

</font>
</body>
</html>
