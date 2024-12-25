<table width=400>
<tr>
  <td width="100px">
    <script language="JavaScript">
    document.write('<a href="' + window.location.protocol + '//' + window.location.hostname + ':8080' + '" target="pat" title="Pat Email Client"><strong>PatEmail</strong></a> ' );
    </script>
  </td>
  <td width="100px">
    <a href="axcall.php" target="axcall" title="Connect to radio/BBS"><strong>AXCall</strong></a>
  </td>
  <td width="100px">      
    <a href="/js8" target="js8" title="Display JS8Call screen"><strong>JS8Call</strong></a>
  </td>
</tr>
<tr>
  <td>
    <a href="/ft8" target="ft8" title="Dispaly FT8 screen"><strong>WSJTX FT8</strong>
  </td>
  <td>
    <a href="/tv" target="tv" title="Dispaly SSTV screen"><strong>SSTV</strong>
  </td>
  <td>
    <a href="/fld" target="fld" title="Display FLDigi screen"><strong>FLDigi</strong></a>
  </td>
</tr>
<tr>
  <td>
    <a href="/wifi.php" title="Setup Wifi connection"><strong>Wifi</strong></a>
  </td>
  <td>
    <a href=/shell.php target="shell" title="Command prompt"><strong>Shell</strong></a>
  </td>
  <td>
    <a href=/log.php title="Direwolf Log" target="log"><strong>PktLog</strong></a>
  </td>
</tr>
<tr>
  <td >
    <a href=/syslog.php title="System log file" target="syslog"><strong>SysLog</strong></a>
  </td>
  <td >
    <a href=/direwatch.php target="screen"><strong>Screen</strong></a>
  </td>
  <td colspan="1">
     <a href="/webchat.php" target="webchat" title="APRS Messaging"><strong>Webchat</strong></a>
  </td>
</tr>

<?php
  if (!file_exists("/var/cache/digipi/localized.txt")) {
    echo '<tr><td colspan=3><a href="/setup.php" title="REQUIRED!  Enter your callsign and other local information" " target="setup"><font color="green"><strong>Initialize</strong></font></a> </td></tr>';
  }
?>  

</table>
