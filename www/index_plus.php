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
  <h1 class="title">DigiPi Plus</h1>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
  <iframe src="plus_menu.php" name="iframe_b" width=100% height=50% scrolling="vertical"></iframe>
  
  <div class="settings">
  <a href="/shell.php" title="Command Prompt" target='iframe_a'>
    <img src="/images/icons/shell.png" width=32px height=32px>
    <strong>Shell</strong>
  </a>
  </div>
  
  <div class="settings">
  <a href="/syslog.php" title="System Log File" target='iframe_a'>
    <img src="/images/icons/slog.png" width=32px height=32px>
    <strong>SysLog</strong>
  </a>
  </div>
  
  <div class="settings">
  <a href="/log.php" title="Direwolf Packet Log File" target='iframe_a'>
    <img src="/images/icons/plog.png" width=32px height=32px>
    <strong>PktLog</strong>
  </a>
  </div>
  
  <div class="settings">
  <a href="/help.php" title="Digipi Plus Help" target='iframe_a'>
    <img src="/images/icons/help.png" width=32px height=32px>
    <strong>Help</strong>
  </a>
  </div>
  
  <div class="settings">
  <script>
    document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':6080/vnc.html?port=6080&password=test11&autoconnect=true" target="iframe_a">' )
  </script>
    <img src="/images/icons/screen.png" width=32px height=32px>
    <strong>VNC</strong>
  </a>
  </div>
  
  <div class="settings">
  <script>
    document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8080" target="iframe_a">' )
  </script>
    <img src="/images/icons/email.png" width=32px height=32px>
    <strong>Email</strong>
  </a>
  </div>
  
  <div class="settings">
  <script>
    document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8055" target="iframe_a">' )
  </script>
    <img src="/images/icons/webchat.png" width=32px height=32px>
    <strong>Webchat</strong>
  </a>
  </div>
  
  <div class="settings">
  <a href="/help/index.php" title="Digipi Plus Help" target='iframe_a'>
    <img src="/images/icons/help.png" width=32px height=32px>
    <strong>Help</strong>
  </a>
  </div>
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
