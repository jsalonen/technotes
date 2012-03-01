# Git

## Setting up Git

### Setting up Git for Windows

See: <http://help.github.com/win-set-up-git/>

Remember to use Git bash instead of cmd.exe or PowerShell!
It's ridiculously simple and effective to use.

Go to your .ssh:

	cd ~/.ssh

If you want to remove and backup old keys:

	mkdir key_backup
	cd id_rsa* key_backup
	rm id_rsa*

Generate key:

	ssh-keygen -t rsa -C "email@domain.com"

- Instead of passwords, git uses SSH public key authentication
- Using SSH key without a passphrase is like storing your passwords in a .txt file (for anyone to pickup and use)
- => always use passphrases with ssh keys

Adding/changing passphrases in existing keys:

	ssh-keygen -p

Remembering passphrases. Use ssh-agent. For details and code see: <http://help.github.com/ssh-key-passphrases/>


## Using Git

Create new repository
`git init`

ALIASES
In ~/.gitconfig:

[alias]
	hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short

Staging:
`git add ...`
`git rm ...`

Create new remote
`git remote add URL`

Initial push to master:
`git push -u origin master`

Next time you can just do:
`git push`

Ignoring files:
- Create `.gitignore`

Sample:

	# Can ignore specific files
	.DS_Store

	# Use wildcards as well
	*~
	*.swp

	# Can also ignore all directories and files in a directory.
	tmp/**/* 

Pull changes from remote repository:

`git pull`

Resetting stashing:

`git reset`

`git reset HEAD`

`git reset --hard HEAD`

## Tagging

List tags:

	git tag

List tags (wildcard search):

	git tag -l v0.1*

Creating tag:

	git tag -a v0.2 -m 'Version 0.2'

	v0.2 = tag name
	-m = add annotation

Sharing tags:

	git push --tags
