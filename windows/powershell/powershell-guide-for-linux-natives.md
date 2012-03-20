# A Tiny Windows PowerShell Guide for Linux Natives

<div>
  <p><img src="https://raw.github.com/jsalonen/technotes/master/windows/powershell/powershell-guide-deco.jpg"></p>
</div>

The intend of this guide is to provide a quick and painless introduction of Windows PowerShell and its tools to users familiar with Unix and Linux shell tools.

## Motivation

**If you need shell tools for Windows, stop crippling yourself with old and unsuitable tools like Windows Command Prompt and Linux shell emulators. Seriously.**

For power users, command prompt is simply not good enough. Yes, you can use Unix-style shell emulators as well, but
they are hacky at the best. Granted that both the prompt and shell emulators can be used to do many of the
everyday tasks, but the more complex your tasks get, the less these tools provide you with good facilities.

The bottom line is Windows is not Unix. Factually, they are two completely different ecosystems, which share 
some of the core of principles, but don't work exactly the same way. If you want to work in Windows,
I really encourage you to familiarize yourself with Windows PowerShell. Yes, it requires an initial investment
of time and effort. Risk it and you may find yourself becoming even more productive and comfortable working on
Windows.

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
      <td><code>alias c=command</code></td>
      <td><code>set-alias c=command</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code></code></td>
      <td><code></code></td>
      <td></td>
    </tr>
</table>

*Disclaimer: the listed commands are rough equivalents.*

## Recipes

### Show Processes Consuming the Most CPU (`top`)

    while (1) { ps | sort -desc cpu | select -first 25; sleep 1}

### List USB Devices (`lsusb`)

    gwmi Win32_USBControllerDevice

### Download a File (`wget` or `curl`)

    (new-object System.Net.WebClient).DownloadFile('http://example.com', 'output.html')

Or just get `curl` for Windows and run:

    curl http://example.com > output.html

### Rip CD/DVD (@TBD@)

Bash:

    cat /dev/sdb > file.iso    
    or
    dd if=/dev/sdb of=file.iso

Stuff: <http://winserverteam.org.uk/blogs/austin/archive/2007/11/02/burn-cd-s-and-dvds-with-powershell.aspx>

### Manage Swap (@TBD@)

Bash:

    swapoff
    swapon [file]

# References and Further Reading

- Mastering PowerShell. Available also as an eBook. (<http://powershell.com/cs/blogs/ebook/>).
- PowerShell vs Bash Compared (PowerShell for Unixers) (<http://xahlee.org/powershell/PowerShell_for_unixer.html>)
- PowerShell as cmd.exe or Bash (<http://xahlee.org/powershell/commands.html>)
- An excellent article about curl, wget and PowerShell. (<http://blog.commandlinekungfu.com/2009/11/episode-70-tangled-web.html>)
- Bash vs PowerShell. Windows PowerShell Blog. (<https://blogs.msdn.com/b/powershell/archive/2008/07/08/bash-vs-powershell.aspx>)
- Writing Command-line Tools with IronPython and Visual Studio. PyCon 2011 Presentation. (<http://www.slideshare.net/noahgift/iron-python-command-line>)
- You can’t be a 21st century admin without PowerShell. (<http://blogs.technet.com/b/jamesone/archive/2009/11/02/you-can-t-be-a-21st-century-admin-without-powershell.aspx>)

# Copyright Information

- Header image by solaro. Some rights reserved. (<http://flickr.com/photos/solaro/2127576608/sizes/z/in/photostream/>)
