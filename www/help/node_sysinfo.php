<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <LINK href="../styles/simple.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1 id="resizing-digipi-sd-card">Use Screenfetch to update node Info command.</h1>
<h2 id="step-by-step-instructions">Step by Step Instructions</h2>
<p>Note: This requires being able to write to the SD Card. See this tutorial on how to change from read-only to read-write.</p>
<p>From the command line or a terminal window enter the following</p>
<pre><code>
sudo remount
sudo apt install screenfetch
</code></pre>

<p>Create a cron job to run every minute.</p>
<pre><code>
sudo crontab -e
</code></pre>

<p>If there is an option to create a new file, select Y; if there is an option to select an editor, select NANO</p>
<p>Scroll down to the end of the file and add the following line.</p>
<pre><code>
*/1 * * * * screenfetch -d '-host;-shell;-pkgs' > /etc/ax25/uronode.info
</code></pre>

<p>Press <code>ctrl-x</code> then press <code>s</code> to close and save the file. You should now see an update every minute in your syslog. </p>

<p>Now let's remove that from spamming the log every minute. This requires a minor edit to a config file.</p>
<pre><code>
sudo nano /etc/rsyslog.conf
</code></pre>

<p>Scroll down and find the line...</p>
<pre><code>
*.*;auth,authpriv.none             -/var/log/syslog
</code></pre>
<p>Add <code>cron,</code> to it so it says the following</p>
<pre><code>
*.*;cron,auth,authpriv.none             -/var/log/syslog
</code></pre>

<p>Press <code>ctrl-x</code> then press <code>s</code> to close and save the file. Reboot the DigiPi</p>

<pre><code>
sudo shutdown now -r
</code></pre>

<p>Verify everything is working by viewing the uronode.info file, or with the 'Info' command when you telnet into the node.</p>
  
<br>
  
<a href="index.php">Back</a>
</body>
</html>
