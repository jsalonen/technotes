# Linux (Red Hat)

Some rudimentary Linux stuff

## Managing system

### Using apt

Upgrade (update system):

	sudo apt-get update
	sudo apt-get upgrade

Install (yes, rudimentary):

	sudo apt-get install [package]

### Hardware

Display hardware config:

	lshw

Display USB status:

	lsusb

Display PCI status:

	lspci

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


## Managing network

### Network adapters

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
    
*Warning: it may be wise to backup iptables file, if you wish to edit it manually!*
