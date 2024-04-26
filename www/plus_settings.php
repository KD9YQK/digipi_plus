<table>
<tr>
  <td>
    <a href="/wifi.php" title="Setup Wifi connection"><strong>Wifi</strong></a>
  </td>
  <td>
    <a href=/shell.php target="shell" title="Command prompt"><strong>Shell</strong></a>
  </td>
  <td >
    <a href=/syslog.php title="System log file" target="syslog"><strong>SysLog</strong></a>
  </td>
</tr>
<tr>
  <td>
    <a href=/log.php title="Direwolf Log" target="log"><strong>PktLog</strong></a>
  </td>
  <td>
    <a href=/index.php><strong>Refresh</strong></a>
  </td>
</tr>
</table>

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
