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


## Managing firewall

### Starting / stopping firewall

    /etc/init.d/iptables start
    /etc/init.d/iptables stop
    /etc/init.d/iptables restart
