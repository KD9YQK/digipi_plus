<?php include 'header.php' ?>

<style>
    /* Style the tab */
    .tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

    /* Style the buttons inside the tab */
    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current tablink class */
    .tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        display: none;
        padding: 6px 12px;
        -webkit-animation: fadeEffect 1s;
        animation: fadeEffect 1s;
    }

    /* Fade in tabs */
    @-webkit-keyframes fadeEffect {
        from {opacity: 0;}
        to {opacity: 1;}
    }

    @keyframes fadeEffect {
        from {opacity: 0;}
        to {opacity: 1;}
    }
</style>

<form action="index.php" method="post">

<div class="tab">
  <button class="tablinks" id="defaultOpen" onclick="openMenu(event, 'Services')">Services</button>
  <button class="tablinks" onclick="openMenu(event, 'Programs')">Programs</button>
  <button class="tablinks" onclick="openMenu(event, 'Settings')">Settings</button>
</div>

<table>
<tr>
    <td>
        <div id="Services" class="tabcontent">
            <?php include 'orig_services.php' ?>
            <?php include 'orig_form.php' ?>
            <?php include 'plus_services.php' ?>
            <?php include 'plus_form.php' ?>
        </div>

        <div id="Services" class="tabcontent">
            <?php include 'orig_links.php' ?>
            <?php include 'plus_links.php' ?>
        </div>

        <div id="Services" class="tabcontent">
            <?php include 'plus_settings.php' ?>
        </div>
    </td>
    <td>
        <iframe src="index.php" name="iframe_a" style="height:90vh; width:100%;" title="Digipi Plus"></iframe>
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
