<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <LINK href="../styles/simple.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1 id="resizing-digipi-sd-card">Resizing Digipi SD Card</h1>
<h2 id="step-by-step-instructions">Step by Step Instructions</h2>
<p>From the command line or a terminal window enter the following</p>
<pre><code>sudo remount
sudo systemctl daemon-reload
sudo fdisk <span class="hljs-regexp">/dev/mm</span>cblk0
</code></pre><p>Then type <code>p</code> to list the partition table</p>
<p>There should be two partitions. if you look in the last column labeled Type you should have...</p>
<ol>
<li>W95 FAT32</li>
<li>Linux</li>
</ol>
<h3 id="make-a-note-of-the-start-number-for-partiton-2-">Make a note of the start number for partiton 2!!!</h3>
<p>This will be needed later. It will likely still be on the screen (just in case).</p>
<p>Type <code>d</code> to delete a partition.</p>
<p>Type <code>2</code> to select the Linux partition</p>
<p>Now you can resize the main partition. </p>
<p>Type <code>n</code> to create a new partition.</p>
<p>This new partition needs to be a primary partition so type <code>p</code>.</p>
<p>Next enter <code>2</code> when prompted for a partition number.</p>
<p>You will now be prompted for the first sector for the new partition.</p>
<h3 id="enter-the-start-number-from-the-earlier-step-the-linux-partition-">Enter the start number from the earlier step!!! (the Linux partition)</h3>
<p>Next you will be prompted for the last sector you can just hit <code>enter</code> to accept the default which will utilize the remaining disk space.</p>
<p>When asked to delete the existing ext4 signature, press <code>n</code></p>
<p>Type <code>w</code> to save the changes you have made.</p>
<p>Next reboot the system with the following command:
<code>sudo reboot</code>
once the system has reboot and you are back at the commandline enter the following command:</p>
<pre><code>sudo remount
sudo<span class="hljs-keyword"> system</span>ctl daemon-reload
sudo resize2fs /dev/mmcblk0p2
</code></pre><p>Note: this can take a long time (depending on the card size and speed) be patient and let it finish so you do not mess up the file system and have to start from scratch.</p>
<p>Once it is done reboot the system with the following command:
<code>sudo reboot</code>
You can now verify that the system is using the full capacity of the SD Card by entering the following command:
<code>df -h</code></p>
<br>
<a href="index.php">Back</a>
</body>
</html>
