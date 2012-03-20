# Windows PowerShell for Linux Natives

# Cheatsheet: Typical Linux vs. PowerShell Commands

<table>
    <tr>
        <th>Typical Linux Shell</th>
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
      <td><code>top</code></td>
      <td><a href="http://superuser.com/a/176625/25810">[1]</a>, <a href="http://jon.netdork.net/2010/04/06/powershell-top-x-processes-using-cpu/">[2]</a></td>
      <td></td>
    </tr>
    <tr>
      <td><code>lsusb</code></td>
      <td><code>gwmi Win32_USBControllerDevice</code></td>
      <td></td>
    </tr>
    <tr>
      <td><code></code></td>
      <td><code></code></td>
      <td></td>
    </tr>
</table>

*Disclaimer: the listed commands are rough equivalents.*

## Recipes to consider

Rip CD/DVD:

    cat /dev/sdb > file.iso    
    or
    dd if=/dev/sdb of=file.iso

Manage swap:

    swapoff
    swapon [file]


    




