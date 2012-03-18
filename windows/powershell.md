# Using Windows PowerShell

First point: PowerShell is awesome. When using Windows, don't cripple
yourself with cmd.exe or cygwin, when you can use the best tool available,
that is: the Windows PowerShell.

Ok, I am somewhat kidding, but there are really good points on why you
should use PowerShell in Windows. I really suggest that you read this:

	<http://blogs.technet.com/b/jamesone/archive/2009/11/02/you-can-t-be-a-21st-century-admin-without-powershell.aspx>

## Introduction

Basic stuff:

- Remember to use TAB a lot for auto-completing commands (who likes writing too much anyway)
- You are no longer able to run executables with "filename", you need to do ".\filename" (equivalent of ./filename in unix)
  - Autocomplete is your friend here as well

### Opening PowerShell and Checking Version

- Just look for `PowerShell` in start menu.
- Check that letters `PS` are present in your prompt indicating you are in PowerShell (not in standard `cmd.exe` shell)

Check your PowerShell version:

	$PSVersionTable.PSVersion

Make sure you are using PowerShell 2 (Major=2, others don't matter right here)

### Using Profile

Where your profile location:

	$PROFILE

Reloading your profile:

	. $PROFILE

More stuff: <http://msdn.microsoft.com/en-us/library/windows/desktop/bb613488%28v=vs.85%29.aspx>

## Aliases

List aliases:

	Get-Alias 

Add alias:

	Set-Alias [alias] [command]

Example:

	Set-Alias lc longcommandname

Exporting to file:

	Export-Alias -Path aliases.txt

Importing from file:

	Import-Alias -Path aliases.txt

You can add this command or individual Set-Alias commands to your PowerShell profile!

### Managing modules with PsGet

Search and install PowerShell modules easy: <http://psget.net/>

Note that you may need to change your execution policy to allow using PsGet.
(You need to run this as administrator):

	Set-ExecutionPolicy RemoteSigned

Now install PsGet:

	(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

## Modules

### PsUrl - E.g. wget for PowerShell

Install it with PsGet:

	install-module PsUrl

Simple `wget` style get URL:

	get-url http://example.com

Get and save to file:

	get-url http://example.com > example.html

More cool stuff:

	https://github.com/chaliy/psurl/

### Using Git from PowerShell

#### Getting Started

Verify `git/bin` (or whatever is the location of
bin folder under the place you installed git) is in your `PATH`

#### Prompt for Git repositories, tab completion (posh-git)

Posh-git adds some sugar. Features:

- Prompt for Git repositories
- Tab completion for common commands when using git

Install it:

	Install-Module posh-git

If that doesn't work out, check out details at
<https://github.com/dahlbyk/posh-git>.

Also you can try reloading your profile:

	. $PROFILE

### Using Python's Virtualenv from PowerShell

System's execution policies need to be relaxed.
Run this in PowerShell (as administrator):

	Set-ExecutionPolicy AllSigned

For more details on execution policies, type:

	Get-Help Set-ExecutionPolicy

#### Setting up SSH agent for PowerShell

SSH agent is basically a program that remember your SSH
keyphrases so you don't have to repeat them every time
you perform a git operation requiring authentication.

Get the SSH agent management snippet. For details see: http://markembling.info/2009/09/ssh-agent-in-powershell

When you have installed it, run:

	Start-SshAgent

Next time you start your PowerShell the SSH agent is
going to be up and running. It's quite allright
to leave it that way. 

When you want to stop the agent, just run:

	Stop-SshAgent

Note that as long as you want it to remember your
passphrases, you need to keep it running.

## System Administration

### Managing PATH

What is in your path:

    $env:path
    
Add to path:

    $env.path+"C:\Program Files\My Program\bin"
    
Update registry:

    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $env:path

### Managing Services

List services:

	Get-Service

More stuff: http://www.youtube.com/watch?v=I8fyElEGo60&feature=related

## Creating Your Own Scripts

Example (`helloworld.ps1`):

	"Hello World!"

Example 2: Using Input Parameters:

	param($Param1, $Param2)
	"You specified following parameters:"
	"$Param1"
	"$Param2"

## Recipes

### Writing Errors to Console

	$Host.UI.WriteErrorLine("Your error message")

### Alert WIndow

	[System.Windows.Forms.MessageBox]::Show("Add your alert message here")

### Current Directory vs. Current Location

- When you `cd` PowerShell doesn't change current working directory
- This may become problematic on many occassions

More notes: <http://huddledmasses.org/powershell-power-user-tips-current-directory/>

### Rotating an Image File

	[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms"); 
	$i = new-object System.Drawing.Bitmap("C:\Filepath\file.jpg); 
	$i.rotateflip("Rotate90FlipNone"); 
	$i.Save("C:\Filepath\file-rotated.jpg");

### Greater than, smaller than

Greater than comparisons:

	$a -gt $b

Smaller than:

	$a -lt $b

Etc.
