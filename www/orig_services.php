<?php   


$submit = "none";

if (isset($_POST["tnc"])) {
  $submit = $_POST["tnc"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start tnc');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop tnc');
      echo $output;
  }
}


if (isset($_POST["digipeater"])) {
  $submit = $_POST["digipeater"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start digipeater');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop digipeater');
      echo $output;
  }
}

if (isset($_POST["tracker"])) {
  $submit = $_POST["tracker"];
    if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start tracker');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop tracker');
      echo $output;
  }
}

if (isset($_POST["webchat"])) {
  $submit = $_POST["webchat"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start webchat');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop webchat');
      echo $output;
  }
}

if (isset($_POST["tnc300b"])) {
  $submit = $_POST["tnc300b"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start tnc300b');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop tnc300b');
      echo $output;
  }
}
if (isset($_POST["winlinkrms"])) {
  $submit = $_POST["winlinkrms"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start winlinkrms');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop winlinkrms');
      echo $output;
  }
}

if (isset($_POST["pat"])) {
  $submit = $_POST["pat"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start pat');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop pat');
      echo $output;
  }
}

if (isset($_POST["ardop"])) {
  $submit = $_POST["ardop"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start ardop');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop ardop');
      echo $output;
  }
}
if (isset($_POST["rigctld"])) {
  $submit = $_POST["rigctld"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start rigctld');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop rigctld');
      echo $output;
  }
}

if (isset($_POST["node"])) {
  $submit = $_POST["node"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start node');
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop node');
      echo $output;
  }
}

if (isset($_POST["wsjtx"])) {
  $submit = $_POST["wsjtx"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start wsjtx');
      sleep(5);
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop wsjtx');
      echo $output;
  }
}
if (isset($_POST["fldigi"])) {
  $submit = $_POST["fldigi"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start fldigi');
      sleep(5);
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop fldigi');
      echo $output;
  }
}

if (isset($_POST["js8call"])) {
  $submit = $_POST["js8call"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start js8call');
      sleep(5);
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop js8call');
      echo $output;
  }
}
if (isset($_POST["sstv"])) {
  $submit = $_POST["sstv"];
  if ( $submit == 'on' ) {
      $output = shell_exec('sudo systemctl start sstv');
      sleep(5);
      echo $output;
  }
  if ( $submit == 'off' ) {
      $output = shell_exec('sudo systemctl stop sstv');
      echo $output;
  }
}


?>
