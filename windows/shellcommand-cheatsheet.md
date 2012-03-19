# Cheatsheet: Shell Commands in Windows

<table>
    <tr>
        <th>Cygwin (bash)</th>
        <th>PowerShell</th>
        <th>Command Prompt</th>
    </tr>
    <tr>
      <td><code>cd ~</code></td>
      <td><code>cd ~</code></td>
      <td><em>N/A</em></td>
    </tr>
    <tr>
      <td><code>rm -Rf dirname</code></td>
      <td><code>Remove-Item -Recurse -Force dirname</code></td>
      <td><code>rmdir /s /q dirname</code></td>
    </tr>
    <tr>
      <td><code>find . | xargs grep 'string' -ls</code></td>
      <td><code>ls | Select-String "string"</code></td>
      <td><em>N/A</em></td>
    </tr>
</table>
