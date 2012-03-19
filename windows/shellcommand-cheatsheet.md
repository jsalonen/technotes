# Cheatsheet: Shell Commands in Windows

| Cygwin                             | Command Prompt                 | PowerShell                            |
| ---------------------------------- | ------------------------------ | ------------------------------------- |
| `rm -Rf dirname`                   | `rmdir /s /q dirname`          | `Remove-Item -Recurse -Force dirname` |
| `find . | xargs grep 'string' -ls` | N/A                            | ls | Select-String "string"           |

