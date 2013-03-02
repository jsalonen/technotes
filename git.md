# Git

## Setting up Git

### Setting up Git for Windows

See: <http://help.github.com/win-set-up-git/>

Remember to use Git bash instead of cmd.exe or PowerShell! It's
ridiculously simple and effective to use.

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

### Minimal Configurations

It is strongly recommended to set yourself username and email to label your commits:

    git config --global user.name "Firstname Lastname"
    git config --global user.email "your_email@youremail.com"    
   
### Using PowerShell instead of Git bash

See: [Powershell.md](powershell.md)

## Using Git

### Creating new repository

    mkdir project
    cd project
    git init

### Aliases

You find them at `~/.gitconfig` in section `alias`:

    [alias]
        st = status
        hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short

### Staging

    git add [pattern]
    git rm [pattern]

A nice shorthand for updating all currently tracked files that are either modified or deleted:

   git add -u

#### Using ignores (.gitignore)

To leave out files from git, specify them as masks in `.gitignore` files. Each directory can have its own ignore file.

Sample file:

    # Example 1: Ignoring specific file
    .DS_Store

    # Example 2: Ignore with wildcard matching
    *~
    *.swp

    # Example 3: You can also ignore stuff from subdirectories
    tmp/**/* 

Examples:

    git add README.txt
    git rm README.old

### Managing remotes

Create new remote:

    git remote add <remotename> <remoteurl>

For instance, you could have a remote with name `origin`. 

### Pushing and pulling

- Pushing = you want to update (push) your local changes to a remote repository.
- Pulling = you want to fetch (pull) remote changes to your local repository.

To initially push stuff to remote (named origin) run:

    git push -u origin master

Next time you can just do:

    git push

To pull changes from remote repository:

    git pull

Resetting stashing:

`git reset`

`git reset HEAD`

`git reset --hard HEAD`

## Checking out

### Selectively checkout only chosen files

    git checkout tmp/**

## Merging and Conflicts

**Auto-merge with pull**

    git pull
    git push

**Typical merge (no conflicts):**

    git fetch
    git status
    git merge origin/master
    git push

Done

**Merge with conflicts:**

    git fetch
    git status

Find and fix conflicts:

    git diff

When fixed, add:

    git add [filename]

Commit and push back:

    git commit -m "..."
    git push
    
HINT! Before push you can fix invalid commit message with amend:

    git commit --amend -m "New commit message"

## Tagging

List tags:

    git tag

List tags (wildcard search):

    git tag -l v0.1*

Creating tag:

    git tag -a v0.2 -m 'Version 0.2'

    v0.2 = tag name
    -m = add annotation

Sharing tags (they are not pushed to remote by default):

    git push --tags

## Recipes

### Updating a Github Fork From the Original Repo

From: <http://bradlyfeeley.com/2008/09/03/update-a-github-fork-from-the-original-repo/>

And a remote and a track it:
    git remote add --track master user1 git://github.com/user1/reponame.git

List remotes:
    git remote

Fetch and merge:
    git fetch user1
    git merge user1/master
