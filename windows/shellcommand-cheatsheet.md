# Cheatsheet: Shell Commands in Windows

## Typical Linux Shell Commands vs. PowerShell Commands

<table>
    <tr>
        <th>Typical Linux Shell</th>
        <th>PowerShell</th>
        <th>Command Prompt</th>
    </tr>
    <tr>
      <td><code>ls</code><br>&nbsp;</td>
      <td><code>ls</code><br><code>dir</code></td>
      <td><code>dir</code><br>&nbsp;</td>
    </tr>
    <tr>
      <td><code>man command</code><br>&nbsp;</td>
      <td><code>man command</code> (alias)<br><code>get-help command</code> (native)</td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>rm -Rf dirname</code></td>
      <td><code>remove-item -recurse -force dirname</code></td>
      <td><code>rmdir /s /q dirname</code></td>
    </tr>
    <tr>
      <td><code>cd ~</code></td>
      <td><code>cd ~</code></td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>find . | xargs grep 'string' -ls</code></td>
      <td><code>ls | select-string "string"</code></td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>ps</code><br>&nbsp;</td>
      <td><code>ps</code> (alias)<br><code>get-process</code> (native)</td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>ps -aux | grep yourprocess</code><br>&nbsp;</td>
      <td><code>ps yourprocess*</code> (alias)<br><code>get-process yourprocess*</code> (native)</td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>kill 1234</code><br>&nbsp;</td>
      <td><code>kill 1234</code> (alias)<br><code>stop-process 1234</code> (native)</td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>top</code></td>
      <td><a href="http://superuser.com/a/176625/25810">[1]</a>, <a href="http://jon.netdork.net/2010/04/06/powershell-top-x-processes-using-cpu/">[2]</a></td>
      <td>-</td>
    </tr>
    <tr>
      <td><code>lsusb</code></td>
      <td><code>gwmi Win32_USBControllerDevice</code></td>
      <td>-</td>
    </tr>
    <tr>
      <td><code></code></td>
      <td><code></code></td>
      <td>-</td>
    </tr>
</table>

Disclaimer: the listed commands are rough equivalents.
