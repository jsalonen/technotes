# Cheatsheet: Shell Commands in Windows

<table>
    <tr>
        <th>Cygwin</th>
        <th>Command Prompt</th>
        <th>PowerShell</th>
    </tr>
    <tr>
      <td><code>rm -Rf dirname</code></td>
      <td><code>rmdir /s /q dirname</code></td>
      <td><code>Remove-Item -Recurse -Force dirname</code></td>
    </tr>
    <tr>
      <td><code>find . | xargs grep 'string' -ls</code></td>
      <td><em>N/A</em></td>
      <td><code>ls | Select-String "string"</code></td>
    </tr>
</table>