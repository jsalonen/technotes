# Linux

Some rudimentary Linux stuff, mostly for Debian and Ubuntu.

## Managing Software

### Using apt

Upgrade (update system):

	sudo apt-get update
	sudo apt-get upgrade

Install (yes, rudimentary):

	sudo apt-get install [package]
	
## Managing Users and Groups

### Add, List and Remove Groups

Add group:

	addgroup group1
	
List *your* groups:

	groups
	
All groups can be listed with:

	cat /etc/group

Remove a group:

	delgroup group1

### Add, List and Remove Users

Add user:

	adduser user1
	
Add user to a group:

	adduser user1 group1
	
Remove a user:

	deluser test

#### Differences between adduser and useradd

`man adduser` says:

"adduser and addgroup are friendlier front ends
to the low level tools like useradd, groupadd and
usermod programs, by default choosing Debian policy
conformant UID and GID values, creating a home
directory with skeletal configuration, running a
custom script, and other features."

### Managing Sudoers

Install `sudo`:

	apt-get install sudo
	
Edit sudoers list:

	visudo
	
Minimal configuration example:
	
	# User privilege specification
	root    ALL=(ALL) ALL
	user1 ALL=(ALL) ALL

Now login as a `user1` and run commands via sudo:

	sudo bash

## Managing files

### Transferring files with SCP

Transfer files with SCP:

	scp filename username@targethost.com:~/targetdir

### Mounting filesystem over SSH

	sshfs user@host.com:/sourcefolder/ /home/localuser/targetdir

## Find text in files

Recursively find files that contain `word`:

	grep -r "word" .

Case-insensitive version:

	grep -ir "word" .

## Managing Network

### Network Adapters

List all adapters:

    ifconfig -a

### Firewall

Start / stopping firewall

    /etc/init.d/iptables start
    /etc/init.d/iptables stop
    /etc/init.d/iptables restart

Open port `8080`:

    iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    
Iptables config can be found from:

    /etc/sysconfig/iptables
    
**Warning: it is generally unwise to directly edit the config file**

## Hardware

Display hardware config (Ubuntu Desktop):

	lshw

Display USB status (Ubuntu Desktop):

	lsusb

Display PCI status:

	lspci
