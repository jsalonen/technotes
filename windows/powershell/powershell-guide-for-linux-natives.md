# Windows PowerShell Guide for Linux Natives

<div>
  <p><img src="https://raw.github.com/jsalonen/technotes/master/windows/powershell/powershell-guide-deco.jpg"></p>
  <p>Image: some rights reserved by <a href="https://secure.flickr.com/photos/solaro/2127576608/sizes/z/in/photostream/">solaro / Flickr.com</a></p>
</div>

The intend of this guide is to provide a quick and painless introduction of Windows PowerShell and its tools to users familiar with Unix and Linux shell tools.

## Cheatsheet

<table>
    <tr>
        <th>Bash</th>
        <th>PowerShell</th>
        <th>Notes</th>
    </tr>
    <tr>
      <td><code>ls</code><br>&nbsp;</td>
      <td><code>ls</code><br><code>dir</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>man command</code><br>&nbsp;</td>      
      <td><code>man command</code><br><code>get-help command</code></td>
      <td>`man` is an alias of `get-help`</td>
    </tr>
    <tr>
      <td><code>rm -Rf dirname</code></td>
      <td><code>remove-item -recurse -force dirname</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>cd ~</code></td>
      <td><code>cd ~</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>find . | xargs grep 'string' -ls</code></td>
      <td><code>ls | select-string "string"</code></td>
      <td>`ls` is an alias of `select-string`</td>
    </tr>
    <tr>
      <td><code>ps</code><br>&nbsp;</td>
      <td><code>ps</code><br><code>get-process</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code>ps -aux | grep yourprocess</code><br>&nbsp;</td>
      <td><code>ps yourprocess*</code><br><code>get-process yourprocess*</code></td>
      <td>`ps` is an alias of `get-process`. `grep` works in PowerShell too, but unlike `get-process` it hides the table header.</td>
    </tr>
    <tr>
      <td><code>kill 1234</code><br>&nbsp;<br>&nbsp;</td>
      <td><code>kill 1234</code><br><code>spps 1234</code><br><code>stop-process 1234</code></td>
      <td>`kill` is an alias of `stop-process`</td>
    </tr>
    <tr>
      <td><code></code></td>
      <td><code></code></td>
      <td></td>
    </tr>
</table>

*Disclaimer: the listed commands are rough equivalents.*

## Recipes

### Show Process Consuming the Most CPU (`top`)

    while (1) { ps | sort -desc cpu | select -first 25; sleep 1}

### List USB Devices (`lsusb`)

    gwmi Win32_USBControllerDevice

### Rip CD/DVD (@TBD@)

Bash:

    cat /dev/sdb > file.iso    
    or
    dd if=/dev/sdb of=file.iso

### Download a File

Bash:
  
    curl http://example.com > output.html

PowerShell:

    (new-object System.Net.WebClient).DownloadFile('http://example.com', 'output.html')

(Or just get `curl` for Windows)

### Manage Swap (@TBD@)

Bash:

    swapoff
    swapon [file]

# Other PowerShell Guides

- PowerShell for Unixers (<http://xahlee.org/powershell/PowerShell_for_unixer.html>)


