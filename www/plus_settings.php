<div class="settings" style="margin:0 0 1.5em;">
<a href="/wifi.php" title="Setup Wifi connection">
  <img src="/images/icons/wifi.png" width=32px height=32px>
  <strong>Wifi</strong>
</a>
</div>

<div class="settings" style="margin:0 0 1.5em;">
<a href="/shell.php" title="Command Prompt" target="shell">
  <img src="/images/icons/shell.png" width=32px height=32px>
  <strong>Shell</strong>
</a>
</div>

<div class="settings" style="margin:0 0 1.5em;">
<a href="/syslog.php" title="System Log File" target="syslog">
  <img src="/images/icons/slog.png" width=32px height=32px>
  <strong>SysLog</strong>
</a>
</div>

<div class="settings" style="margin:0 0 1.5em;">
<a href="/log.php" title="Direwolf Packet Log File" target="pktlog">
  <img src="/images/icons/plog.png" width=32px height=32px>
  <strong>PktLog</strong>
</a>
</div>

<div class="settings" style="margin:0 0 1.5em;">
<a href="/direwatch.php" title="Direwatch Screen" target="screen">
  <img src="/images/icons/screen.png" width=32px height=32px>
  <strong>Screen</strong>
</a>
</div>

<div class="settings" style="margin:0 0 1.5em;">
<a href="/index.php" title="Refresh">
  <img src="/images/icons/refresh.png" width=32px height=32px>
  <strong>Refresh</strong>
</a>
</div>

<div class="settings" style="margin:0 0 1.5em;">
<a href="/help.php" title="Digipi Plus Help" target="help">
  <img src="/images/icons/help.png" width=32px height=32px>
  <strong>Help</strong>
</a>
</div>

<input type="submit" name="reboot" value="Reboot">
&nbsp;
<input type="submit" name="shutdown" value="Shutdown">   
&nbsp;
<input title="Write current application configurations (ft8, js8call, etc) to SD card" type="submit" name="save" value="Save Configs">  
&nbsp; 

<?php
if (isset($_POST["reboot"])) {
  $submit = $_POST["reboot"];
  if ( $submit == 'Reboot' ) {
      echo "<br/><br/><strong><font color=red>Restarting DigiPi...</font></strong><br/> ";
#      if (isset($_SERVER['SERVER_ADDR'])) {
#          $IP = $_SERVER['SERVER_ADDR'];
#      }
#      else {
#          $IP = "0.0.0.0";
#      }
      $output = shell_exec("sudo killall direwatch.py");
      $output = shell_exec("sudo /home/pi/digibanner.py -b DigiPi -s Rebooting..."); 
      $output = shell_exec("sudo /sbin/shutdown -r 0");
      echo $output;
  }
}

if (isset($_POST["shutdown"])) {
  $submit = $_POST["shutdown"];
  if ( $submit == 'Shutdown' ) {
      echo "<br/><br/><strong><font color=red>Shutting down DigiPi...</font></strong><br/> ";
      $output = shell_exec("sudo killall direwatch.py");
      $output = shell_exec("sudo /home/pi/digibanner.py -b Digipi -s Shutdown..."); 
      $output = shell_exec("sudo /sbin/shutdown -h 0");
      echo $output;
  }
}

if (isset($_POST["save"])) {
  $submit = $_POST["save"];
  if ( $submit == 'Save Configs' ) {
      echo "<br/><br/><strong><font color=red>Saving configuration...</font></strong><br/> ";
      $output = shell_exec("sudo -i -u pi /home/pi/saveconfigs.sh");
      #echo $output;
      echo "<br/><br/><strong><font color=red>Please reboot or shutdown gracefully.</font></strong><br/> ";
  }
}

?>
