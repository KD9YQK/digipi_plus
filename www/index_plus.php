<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<LINK href="plus.css" rel="stylesheet" type="text/css">
<style>
.body {
  font-family: "Lato", sans-serif;
}

.sidebar {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidebar a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.sidebar .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

.openbtn {
  font-size: 20px;
  cursor: pointer;
  background-color: #111;
  color: white;
  padding: 10px 15px;
  left: 1%;
  bottom: 1%;
  border: none;
  position: absolute;
}

.openbtn:hover {
  background-color: #444;
}

.main {
  transition: margin-left .5s;
  padding: 16px;
  
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
  <iframe src="plus_menu.php" name="iframe_b" width=100% height=80% scrolling="no"></iframe>
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
  <iframe src="syslog.php" name="iframe_a" style="height:96vh; width:100%;" title="Digipi Plus" scrolling="no"></iframe>
</div>

</form>
</font>
</body>
</html>
