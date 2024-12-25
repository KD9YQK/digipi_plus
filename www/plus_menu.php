<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<LINK href="/styles/plus.css" rel="stylesheet" type="text/css">
<script>
function openMenu(evt, tabName) {
    echo console.log("Welcome to GeeksforGeeks!");
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
</script>

<title>DigiPi </title>
<body>
<center>
<form action="plus_menu.php" method="post">
  <div class="tab" style="text-align: center; width:410px;">
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
      <img id="direwatch" src="direwatch.png?v=<?php echo Date("Y.m.d.G.i.s"); ?>" width="400", height="400" />
      <script>
          window.setInterval(refreshDirewatch, 1000);
  
          function refreshDirewatch( )
          {
            document.getElementById("direwatch").src="direwatch.png?v=" + Date("Y.m.d.G.i.s");
          }
      </script>
  </div>
<script>
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

<small>1.9-2 KM6LYW ©2024</small>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/dot"><font size="+3" color="#111">.</font></a>
</form>
</center>
</body>
</html>
