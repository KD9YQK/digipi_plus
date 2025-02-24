<table width="400px">
<!-- does nothing
 <col width="10px" />
 <col width="320px" />
 <col width="70px" />
-->
<?php

# give systemd a chance to settle down
sleep(1);


#-- tnc -------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active tnc');
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>APRS TNC/igate</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="tnc" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='tnc' value='on'  $checked />";
echo '	<span class="switch-label" ></span> ';
echo '	<span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';

#-- tnc300b ----------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active tnc300b');
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>APRS HF TNC/igate</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="tnc300b" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='tnc300b' value='on'  $checked />";
echo '	<span class="switch-label" ></span> ';
echo '	<span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- digipeater -------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active digipeater');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>APRS Digipeater</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="digipeater" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='digipeater' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- tracker -------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active tracker');
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>APRS GPS Tracker</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="tracker" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='tracker' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- webchat ----------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active webchat');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>APRS WebChat</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="webchat" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='webchat' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- Linux NODE AX.25 ------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active node');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>AX.25 Node Network</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="node" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='node' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- Winlink Server -------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active winlinkrms');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>Winlink Email Server</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="winlinkrms" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='winlinkrms' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- Pat Email Client -----------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active pat');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>Pat Winlink Email Client</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="pat" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='pat' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- ARDOP ---------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active ardop');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="red">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>ARDOP Modem</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="ardop" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='ardop' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- RIGCTLD ---------------------------------------------

#echo "<tr>";
#$output = shell_exec('systemctl is-active rigctld');
#$output = chop($output);
#  if ($output == "active")
#  {
#     echo '<td bgcolor="lightgreen">';
#     $checked = "checked";
#  }
#  elseif ($output == "failed")
#  {
#     echo '<td bgcolor="red">';
#     $checked = "";
#  }
#  else
#  {
#     echo '<td bgcolor="lightgrey">';
#     $checked = "";
#  }
#echo '</td>';
#echo '<td>';
#echo '<font size=+1>Rig Control Daemon</font></td>';
#echo '<td nowrap>';
#echo '<form action="plus_menu.php" method="post">';
#echo '<label class="switch switch-light">';
#echo '  <input type="hidden" name="rigctld" value="off">';
#echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='rigctld' value='on'  $checked />";
#echo '  <span class="switch-label" ></span> ';
#echo '  <span class="switch-handle"></span> ';
#echo '</label>';
#echo '</form>';
#echo '</font>';
#echo '</td></tr>';


#-- WSJTX FT8  -------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active wsjtx');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>WSJTX FT8</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="wsjtx" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='wsjtx' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- SSTV --------------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active sstv');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>Slow Scan TV</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="sstv" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='sstv' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- FLDIGI --------------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active fldigi');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>FLDigi</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="fldigi" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='fldigi' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#-- JS8CALL -------------------------------------------------

echo "<tr>";
$output = shell_exec('systemctl is-active js8call');
#$output = str_replace("failed", "inactive", $output);
$output = chop($output);
  if ($output == "active")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "checked";
  }
  elseif ($output == "failed")
  {
     echo '<td bgcolor="lightgreen">';
     $checked = "";
  }
  else
  {
     echo '<td bgcolor="lightgrey">';
     $checked = "";
  }
echo '</td>';
echo '<td>';
echo '<font size=+1>JS8Call</font></td>';
echo '<td nowrap>';
echo '<form action="plus_menu.php" method="post">';
echo '<label class="switch switch-light">';
echo '  <input type="hidden" name="js8call" value="off">';
echo "  <input onChange='this.form.submit()' class='switch-input' type='checkbox' name='js8call' value='on'  $checked />";
echo '  <span class="switch-label" ></span> ';
echo '  <span class="switch-handle"></span> ';
echo '</label>';
echo '</form>';
echo '</font>';
echo '</td></tr>';


#craiger systemd thinks a sigkill is a failure, so reset failed service status
#This will turn red/failed service into grey/stopped 
$output = shell_exec('sudo systemctl reset-failed fldigi 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed sstv 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed wsjtx 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed ardop 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed tnc300b 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed tracker 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed digipeater 2> /dev/null');
$output = shell_exec('sudo systemctl reset-failed tnc 2> /dev/null');
$output = shell_exec('sudo systemctl reset-failed node 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed winlinkrms 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed pat 2> /dev/null'); 
$output = shell_exec('sudo systemctl reset-failed js8call 2> /dev/null'); 
?>
</table>
