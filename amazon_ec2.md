# Amazon EC2

Running security updates: `sudo yum update`

## Running MongoDB on EC2 

Notes: <http://www.mongodb.org/display/DOCS/Amazon+EC2>

Mounting Amazon Elastic Block Store (EBS)
http://aws.amazon.com/ebs/
http://aws.amazon.com/articles/1663

Command-line reference:
http://docs.amazonwebservices.com/AWSEC2/latest/CommandLineReference/index.html?ApiReference-cmd-DescribeVolumes.html

Configuring command-line for making EC2 SOAP requests:

- Need to obtain pkey and cert
- Go to Amazon account
- Copy private key and cert to ~/.ssh/
- Export to bash/shell (add to .bashrc)
export EC2_PRIVATE_KEY=~/.ssh/pk-1234567890.pem
export EC2_CERT=~/.ssh/cert-1234567890.pem

NOTE: make sure volumes are in exactly same zones as instances (and other volumes). For example: `eu-west-1c`

FUN COMMANDS (http://paulstamatiou.com/how-to-getting-started-with-amazon-ec2):

`ec2-describe-images -a`
	Well.. Describes all images 

`ec2-describe-instances`
	List out all instances in our EC2 account
	Don't know why it returns blank output!?!?

## How to initialize new filesystem on EBS for MongoDB

They say to mount with noatime and nodiratime (http://www.mongodb.org/display/DOCS/Amazon+EC2)
There is also some ebsmount utility for automated mounting (http://www.turnkeylinux.org/blog/ebsmount)

- Install XFS utils (`sudo yum install xfsprogs`)
- Make sure the tools are running (`grep -q xfs /proc/filesystems || sudo modprobe xfs`)
- Create XFS formatted drive (`sudo mkfs.xfs /dev/sdf`)
- Dunno what this does (`echo "/dev/sdf /vol xfs noatime 0 0" | sudo tee -a /etc/fstab`)
- `sudo mkdir -m 000 /ebsvol1`
- `sudo mount /dev/sdf /ebsvol1`
- WORKS!

Note that they recommend having 4 EBS volumes raided to run as MongoDB stack.

### Configuring MongoDB for this EBS system

sudo mkdir -p /ebsvol1/db/
