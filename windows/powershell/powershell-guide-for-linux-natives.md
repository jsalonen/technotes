# A Tiny Windows PowerShell Guide

<div>
  <p><img src="https://raw.github.com/jsalonen/technotes/master/windows/powershell/img/powershell-guide-deco.jpg"></p>
</div>

The intend of this guide is to provide a quick and painless introduction of Windows PowerShell and its tools, especially for users familiar with Unix and Linux shell tools.

## Motivation

**If you need shell tools for Windows, stop crippling yourself with old and unsuitable tools like Windows Command Prompt and Linux shell emulators. Seriously.**

For power users, command prompt is simply not good enough. Yes, you can use Unix-style shell emulators as well, but
they are hacky at the best. Granted that both the prompt and shell emulators can be used to do many of the
everyday tasks, but the more complex your tasks get, the less these tools provide you with good facilities.

Windows is not Unix. Factually, these are two completely different ecosystems. Many of
the design principles are shared, but the community and the tools are fundamentally different.
Unix tools are made from the premises of the Unix world; applicability to Windows is only a
potential afterthought. Similarly, it is a bad idea to assume Windows tools work smoothly in Linux.

If you want to work in Windows, I really encourage you to familiarize yourself with PowerShell. Yes,
it requires an initial investment of time and effort. Risk it and you may find yourself becoming very
comfortable and even more productive.

## Quick Start

### Open and Configure PowerShell

Find *Windows PowerShell* from the menu. Run it. If you are in Windows 7 or later,
I strongly suggest pin it to your taskbar (Right click -> *Pin to taskbar*). 

Personally I hate the default configuration. The bluish background makes
my eyes bleed. The standard window size is too small. Especially as paths
in Windows are typically very long, width of 80 is insufficient. Also
QuickEdit should be on by default, but sadly, it isn't. 

My preferred settings:

- **Settings**: check on *QuickEdit*
- **Font**: set type to `Consolas` and size to `14`
- **Window**: set buffer and window width `120` and window height to `40`
- **Colors**: set background to black (or whatever you prefer)

Restart and type `$Host.Version` to check which version of PowerShell you are running.
You should end up seeing something like:

<p><img src="https://raw.github.com/jsalonen/technotes/master/windows/powershell/img/powershell-start-screen.png"></p>
  
**We are set to go!**

**Hints:**

- When typing commands, use TAB for auto-completion
- Use `.\myprogram` to run a program or script (just like `./myprogram` in bash)

### Cheatsheet

Get yourself started by using the following list of rough equivalents for typical Linux shell commands in PowerShell.

<table>
    <tr>
        <th>Bash</th>
        <th>PowerShell (compatibility commands)</th>
        <th>PowerShell (native commands)</th>
    </tr>
    <tr>
      <td><code>cd ../new/path</code><br>&nbsp;</td>
      <td><code>cd ..\new\path</code><br>&nbsp;</td>
      <td><code>set-location ..\new\path</code><br><code>sl ..\new\path</code></td>
    </tr>
    <tr>
      <td><code>ls</code><br>&nbsp;</td>
      <td><code>ls</code><br><code>dir</code></td>
      <td><code>get-childitem</code><br><code>gci</code></td>
    </tr>
    <tr>
      <td><code>cat file.txt | more</code><br>&nbsp;</td>  
      <td><code>cat file.txt | more</code><br>&nbsp;</td>  
      <td><code>get-content file.txt | more</code><br><code>gc file.txt | more</code></td>
    </tr>
    <tr>
      <td><code>man command</code><br>&nbsp;</td>      
      <td><code>man command</code><br>&nbsp;</td>
      <td><code>get-help command</code><br><code>help command</code></td>
    </tr>
    <tr>
      <td><code>mkdir dirname</code><br>&nbsp;</td>
      <td><code>mkdir dirname</code><br>&nbsp;</td>
      <td><code>mkdir dirname</code><br><code>md dirname</code></td>
    </tr>
    <tr>
      <td><code>rm -Rf dirname</code></td>
      <td><code>rm -recurse -force dirname</code></td>
      <td><code>remove-item -recurse -force dirname</code><br><code>ri -recurse -force dirname</code></td>
    </tr>
    <tr>
      <td><code>cd ~</code></td>
      <td><code>cd ~</code></td>
      <td><code>set-location $env:home</code><br><code>sl $env:home</code></td>
    </tr>
    <tr>
      <td><code>ps</code><br>&nbsp;</td>
      <td><code>ps</code><br>&nbsp;</td>
      <td><code>get-process</code><br><code>gps</code></td>
    </tr>
    <tr>
      <td><code>ps -aux | grep yourprocess</code><br>&nbsp;</td>
      <td><code>ps | grep yourprocess</code><br>&nbsp;</td>
      <td><code>get-process yourprocess*</code><br><code>gps yourprocess*</code></td>
    </tr>
    <tr>
      <td><code>kill 1234</code><br>&nbsp;</td>
      <td><code>kill 1234</code><br>&nbsp;</td>
      <td><code>stop-process 1234</code><br><code>spps 1234</code></td>
    </tr>
    <tr>
      <td><code>touch filename</code><br>(when creating a new file)</td>
      <td><em>n/a</em><br>&nbsp;</td>
      <td><code>ni filename -type file</code><br><code>new-item filename -type file</code></td>
    </tr>
    <tr>
      <td><code>alias c=command</code></td>
      <td><em>n/a</em></td>
      <td><code>set-alias c=command</code></td>
    </tr>
    <tr>
      <td><code></code></td>
      <td><code></code></td>
      <td></td>
    </tr>
</table>

## Anatomy of PowerShell Commands

For compatibility with command prompt and Unix/Linux style shell usage, PowerShell
uses aliases to its native commands. The native commands itself are often longer
and often in the format of `Verb-Noun` such as `Set-Location`. For convenience,
you do not need to obey letter casing. In fact, I prefer just writing commands
in lowercase and auto-completing the name with *TAB* key if necessary. Aliases
for native commands are often provided as well: for instance, `Set-Location` has
a short-hand of `sl`.

The conceptual difference here is that commands in PowerShell are based on *cmdlets*.
**A cmdlet** is a lightweight command that is used in the Windows PowerShell environment.
By convention, cmdlets are named in the format of *Verb-Noun*. Examples include
`Get-Help`, `Stop-Process` and `Format-List`. It is recommended that verbs are
chosen from a list of approved alternatives (just write `Get-Verb` to see this list).

From the outside, cmdlets seem to work just like programs in Unix/Linux: they
take text (parameters) as input and provide text as output within the processing
pipeline. Externally cmdlets seem to be performing just that as well and can
actually be used in this fashion "just as plain text" for instance with `grep`.

**Instead of raw text, cmdlets operate on objects**; they process input objects
from the pipeline and typically deliver objects as an output to the pipeline.
As such, instead of raw text separated by newline characters, cmdlets process
*objects*, one at a time. Also instead of stand-alone executables, cmdlets are objects
(instances of .NET Framework classes). 

**This all may sound heavy and scary, but it isn't that: cmdlets are basically
just as easy to use as standard executables**. In addition, cmdlets provide us
with some advantanges. *Most notably you don't have to worry about input parsing,
error presentation or output formatting since PowerShell runtime already does
this for you!*

## More Recipes

### Find Occurrences of Given String from Files

Bash:

    find . | xargs grep 'string' -ls
    
PowerShell (native):

    gci | select-string "string"

### Show Processes Consuming the Most CPU (`top`)

    while (1) { cls; ps | sort -desc cpu | select -first 25; sleep 1}

### List Environment Variables
  
    gci env:

### List USB Devices (`lsusb`)

    gwmi Win32_USBControllerDevice

### Download a File (`wget` or `curl`)

    (new-object System.Net.WebClient).DownloadFile('http://example.com', 'output.html')

**Why `curl http://example.com > output.html` may be a bad idea?**

Default encoding in PowerShell is UTF-16, which may end up mangling your file.

### Run process with elevated access (`sudo`)

@TBD@

### Change File Permissions (`chmod`)

@TBD@

### Change File Ownership (`chown`)

@TBD@

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

## References and Further Reading

- [1] Cmdlet Overview (<http://msdn.microsoft.com/en-us/library/windows/desktop/ms714395%28v=vs.85%29.aspx>)
- Why isn't QuickEdit on by default in console windows?. (<http://blogs.msdn.com/b/oldnewthing/archive/2007/09/13/4886108.aspx>)
- PowerShell Community Extensions. Homepage. (<https://pscx.codeplex.com/>)
- Mastering PowerShell. Available also as an eBook. (<http://powershell.com/cs/blogs/ebook/>).
- PowerShell vs Bash Compared (PowerShell for Unixers) (<http://xahlee.org/powershell/PowerShell_for_unixer.html>)
- PowerShell as cmd.exe or Bash (<http://xahlee.org/powershell/commands.html>)
- An excellent article about curl, wget and PowerShell. (<http://blog.commandlinekungfu.com/2009/11/episode-70-tangled-web.html>)
- Bash vs PowerShell. Windows PowerShell Blog. (<https://blogs.msdn.com/b/powershell/archive/2008/07/08/bash-vs-powershell.aspx>)
- Writing Command-line Tools with IronPython and Visual Studio. PyCon 2011 Presentation. (<http://www.slideshare.net/noahgift/iron-python-command-line>)
- You can’t be a 21st century admin without PowerShell. (<http://blogs.technet.com/b/jamesone/archive/2009/11/02/you-can-t-be-a-21st-century-admin-without-powershell.aspx>)
- PowerShell for Unix Hackers - Part I (<https://docs.google.com/View?id=ap5pdc5jjps_58fs9cvwcz>)

## Copyright Information

- Header image by solaro. Some rights reserved. (<http://flickr.com/photos/solaro/2127576608/sizes/z/in/photostream/>)
