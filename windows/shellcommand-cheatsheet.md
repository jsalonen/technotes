# Cheatsheet: Shell Commands in Windows

<table>
    <tr>
        <th>Typical Linux Shell Command</th>
        <th>PowerShell</th>
        <th>Command Prompt</th>
    </tr>
    <tr>
      <td><code>ls</code></td>
      <td><code>ls</code><br><code>dir</code></td>
      <td><code>dir</code></td>
    </tr>
    <tr>
      <td><code>rm -Rf dirname</code></td>
      <td><code>Remove-Item -Recurse -Force dirname</code></td>
      <td><code>rmdir /s /q dirname</code></td>
    </tr>
    <tr>
      <td><code>cd ~</code></td>
      <td><code>cd ~</code></td>
      <td><em>N/A</em></td>
    </tr>
    <tr>
      <td><code>find . | xargs grep 'string' -ls</code></td>
      <td><code>ls | Select-String "string"</code></td>
      <td><em>N/A</em></td>
    </tr>
    <tr>
      <td><code>ps</code><br></td>
      <td><code>ps</code> (alias)<br><code>Get-Process</code> (native method)</td>
      <td><em>N/A</em></td>
    </tr>
    <tr>
      <td><code>ps -aux | grep yourprocess</code></td>
      <td><code>ps | grep yourprocess</td>
      <td><em>N/A</em></td>
    </tr>
    <tr>
      <td><code>top</code></td>
      <td>(todo)[http://jon.netdork.net/2010/04/06/powershell-top-x-processes-using-cpu/]</td>
      <td><em>N/A</em></td>
    </tr>
    <tr>
      <td><code>kill</code></td>
      <td><code>?</code></td>
      <td><em>N/A</em></td>
    </tr>
    <tr>
      <td><code></code></td>
      <td><code></code></td>
      <td><em>N/A</em></td>
    </tr>
</table>
