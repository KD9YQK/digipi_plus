<table width="400px">
 <col width="10px" />
 <col width="320px" />
 <col width="70" />

<?php

# give systemd a chance to settle down
sleep(2);


#-- tnc -------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active tnc');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>TNC & APRS igate</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="tnc" value="on"> ';
echo '<input type="submit" name="tnc" value="off">';
echo "</font>";
echo "</td></tr>";

#-- tnc300b ----------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active tnc300b');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>TNC & APRS igate (HF)</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="tnc300b" value="on"> ';
echo '<input type="submit" name="tnc300b" value="off">';
echo "</font>";
echo "</td></tr>";

#-- digipeater -------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active digipeater');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>APRS Digipeater</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="digipeater" value="on"> ';
echo '<input type="submit" name="digipeater" value="off">';
echo "</font>";
echo "</td></tr>";

#-- webchat ----------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active webchat');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>APRS Webchat</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="webchat" value="on"> ';
echo '<input type="submit" name="webchat" value="off">';
echo "</font>";
echo "</td></tr>";

#-- Linux NODE AX.25 ------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active node');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>Linux Node AX.25</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="node" value="on"> ';
echo '<input type="submit" name="node" value="off">';
echo "</font>";
echo "</td></tr>";


#-- Winlink Server -------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active winlinkrms');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>Winlink Email Server</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="winlinkrms" value="on"> ';
echo '<input type="submit" name="winlinkrms" value="off">';
echo "</font>";
echo "</td></tr>";


#-- Pat Email Client -----------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active pat');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>Pat Winlink Email Client</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="pat" value="on"> ';
echo '<input type="submit" name="pat" value="off">';
echo "</font>";
echo "</td></tr>";


#-- ARDOP ---------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active ardop');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>ARDOP Modem</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="ardop" value="on"> ';
echo '<input type="submit" name="ardop" value="off">';
echo "</font>";
echo "</td></tr>";


#-- RIGCTLD ---------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active rigctld');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>Rig Control Daemon</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="rigctld" value="on"> ';
echo '<input type="submit" name="rigctld" value="off">';
echo "</font>";
echo "</td></tr>";


#-- WSJTX FT8  -------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active wsjtx');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>WSJTX FT8</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="wsjtx" value="on"> ';
echo '<input type="submit" name="wsjtx" value="off">';
echo "</font>";
echo "</td></tr>";


#-- SSTV --------------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active sstv');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>Slow Scan TV</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="sstv" value="on"> ';
echo '<input type="submit" name="sstv" value="off">';
echo "</font>";
echo "</td></tr>";


#-- FLDIGI --------------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active fldigi');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>FLDigi</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="fldigi" value="on"> ';
echo '<input type="submit" name="fldigi" value="off">';
echo "</font>";
echo "</td></tr>";


#-- JS8CALL -------------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active js8call');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
  }
echo "&nbsp;";
echo "</td><td>";
echo "<font size=+1>JS8Call</font></td>";
echo '<td align="right" nowrap>';
echo '<input type="submit" name="js8call" value="on"> ';
echo '<input type="submit" name="js8call" value="off">';
echo "</font>";
echo "</td></tr>";

#craiger systemd thinks a sigkill is a failure, so reset failed service status
#This will turn red/failed service into grey/stopped 
$output = shell_exec('sudo systemctl reset-failed fldigi 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed sstv 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed wsjtx 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed ardop 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed tnc300b 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed digipeater 2> /dev/null');
$output = shell_exec('sudo systemctl reset-failed tnc 2> /dev/null');
$output = shell_exec('sudo systemctl reset-failed node 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed winlinkrms 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed pat 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed js8call 2> /dev/null'); 


?>

</table>
