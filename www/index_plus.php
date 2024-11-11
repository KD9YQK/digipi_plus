<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<LINK href="/styles/plus.css" rel="stylesheet" type="text/css">
<style>
  .body {
    font-family: "Lato", sans-serif;
  }
  
  /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
  @media screen and (max-height: 450px) {
    .sidebar {padding-top: 15px;}
    .sidebar a {font-size: 18px;}
  }
</style>
</head>

<body>

<div id="mySidebar" class="sidebar">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
  <iframe src="plus_menu.php" name="iframe_b" width=100% height=50% scrolling="vertical"></iframe>
  <a href="syslog.php" target='iframe_a'>SysLog</a>
  <a href="log.php" target='iframe_a'>PktLog</a>
  <a href="shell.php" target='iframe_a'>Shell</a>
  <script>
      document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':6080/vnc.html?port=6080&password=test11&autoconnect=true" target="iframe_a">VNC</a>' )
  </script>
  <script>
      document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8080" target="iframe_a">Email</a>' )
  </script>
  <script>
      document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8055" target="iframe_a">WebChat</a>' )
  </script>
  <a href="help/index.php" target='iframe_a'>Help</a>
</div>
<div id="main">
  <button class="openbtn" onclick="openNav()">☰</button>  
  <iframe src="home_plus.php" name="iframe_a" style="height:96vh; width:100%;" title="Digipi Plus" scrolling="no"></iframe>
</div>
<script>
function openNav() {
  document.getElementById("mySidebar").style.width = "480px";
  document.getElementById("main").style.marginLeft = "480px";
}
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>
</body>
</html>
