# Debian (Ubuntu)

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

Change group for files:

	chgrp group1 files
	
You often want to change group **recursively**:

	chgrp group1 -R dirname1

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

## Managing SSH

### SSH Configurations

- Edit `/etc/ssh/sshd_config`
- Restart after changes `/etc/init.d/sshd restart`

### Don't allow root to login via SSH

Make sure you have line:

	PermitRootLogin no
	
### Only allow specific users / groups to login via SSH

	AllowUsers user1 user2
	DenyUsers user3 user 4
	AllowGroups group1 group2
	DenyGroups group3 group4

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

### Installing MySQL

See: <http://ariejan.net/2007/12/12/how-to-install-mysql-on-ubuntudebian>

	sudo apt-get install mysql-server mysql-client
	sudo mysqladmin -u root -h localhost password 'mypassword'
	sudo mysqladmin -u root -h myhostname password 'mypassword'

PHP integration:

	sudo apt-get install php5-mysql

Access MySQL with:

	mysql -u root -p

### Installing Apache

See: <http://www.debianadmin.com/install-and-configure-apache2-with-php5-and-ssl-support-in-debian-etch.html>

	apt-get install apache2
	apt-get install openssl ssl-cert
	apt-get install libapache2-mod-php5 php5-cli php5-common php5-cgi
	openssl req $@ -new -x509 -days 365 -nodes -out /etc/apache2/apache.pem -keyout /etc/apache2/apache.pem
	chmod 600 /etc/apache2/apache.pem

Your config file will be at:

	/etc/apache2/apache2.conf

### Installing PHP

Provided that you have Apache running:

	aptitude install php5 libapache2-mod-php5
	
Restart Apache.

### Installing mod_wsgi

	aptitude install libapache2-mod-wsgi

### Installing node.js

See: <http://www.freshblurbs.com/install-node-js-and-express-js-nginx-debian-lenny>

## Hardware

Display hardware config (Ubuntu):

	lshw

Display USB status (Ubuntu):

	lsusb

Display PCI status:

	lspci
