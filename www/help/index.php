<html>
<head>
    <style>
        p {
        text-indent: 40px;
        }
    </style>
</head>
<body>
<div style="text-align: center;">
<h1><u>DigiPi Plus</u></h1>
</div>
<div>
    <p>DigiPi Plus is intended to be a suppliment to the DigiPi image created by <a href="https://digipi.org" target="_blank">Craig KM6LYW</a>, with the goal being to add more functionality to the original project.
    The idea is to be minimally intrusive to the original system, yet provide a user friendly experience with minimal configuration effort.
    Please enjoy the additions, and feel free to reach out with any comments, bugs, and/or suggestions.</p>
</div>
<div>
    <p>- <a href="https://kd9yqk.com" target="_blank">Bob KD9YQK</a></p>
</div>

<h2><u>Upgrading DigiPi Plus</u></h2>
<p>DigiPi Plus is an ever-expanding project and will be subject to many potential updates in the future. To check for updates, or install additional software, run the following commands.</p>
<pre><code>
    sudo remount
    cd ~/digipi_plus
    git pull
    bash digipi_plus.sh
</code></pre>

<h2><u>Trusted QSL</u></h2>
<div>
    <p>Trusted QSL can be opened by minimizing the active app in the VNC, right-clicking the grey background and selecting it from the pop-up menu.</p>
</div>

<h2><u>OpenWebRX+</u></h2>
<div>
    <p>In order to save OpenWebRX+ configuration, first press the "Save Configs" button in the Settings tab, then turn OFF the OpenWebRX service.
    Next time you start, the configurations should be saved.</p>
</div>

<h2><u>Grid Tracker</u></h2>
<div>
    <p>Grid Tracker can be opened from within the VNC by minimizing WSJT-X and then right-clicking on the grey background. A menu should appear showing Grid Tracker.
    Pressing the "Save Configs" button in the Settings tab is required on your FIRST run in order to create the necessary files, or an error will occur.</p>
    <p>Grid Tracker is only available for Pis with more than 1gb RAM, and will not show in the installer if your Pi doesn't have enough RAM.</p>
</div>

<h2><u>Xastir</u></h2>
<div>
    <p>On the FIRST initial run, press the "Save Configs" button in the Settings tab. Xastir will need to be manually started by right-clicking the grey background 
    in the VNC and selecting it from the menu. Make all your changes to the configuration at this time.</p>
</div>

<h2><u>JS8Spotter</u></h2>
<div>
    <p>JS8Spotter can be opened by minimizing JS8Call in the VNC, right-clicking the grey background and selecting it from the pop-up menu.</p>
</div>

<h2><u>Ham Dashboard</u></h2>
<div>
    <p>Ham Dashboard can be customized to your location by viewing the tutorials videos <a href="https://github.com/VA3HDL/hamdashboard" target="_blank">here.</a></p>
</div>

<h2><u>Misc. Tutorials</u></h2>
<div>
<p>Here are some useful tutorials to aide in the setup of DigiPi.</p>
<p>
<a href="extend_fs.php">Extend Filesystem</a> - Extend the filesystem on the SD-card.
</p><p>
<a href="node_sysinfo.php">Node System Info</a> - Add real time system info to your packet node using crontab and screenfetch.
</p>
</div>
<br>
<small>DigiPi Plus v1.3 KD9YQK ©2024</small>
</body>
</html>
