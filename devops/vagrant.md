# Vagrant

## Installation

Download and install OS specific Vagrant bundle from http://downloads.vagrantup.com/

You also need to install a backend such as VirtualBox (<https://www.virtualbox.org/>).

### Getting Start

This stuff is nicely documented here as well: http://docs.vagrantup.com/v2/getting-started/index.html

Go to your project folder:

    cd myproject
    
Initialize

    vagrant init
    
As a result, `Vagrantfile` is generated

Let's add a box to Vagrant (<http://docs.vagrantup.com/v2/getting-started/boxes.html>):

    vagrant box add precise32 http://files.vagrantup.com/precise32.box

Open `Vagrantfile` and configure it to use the newly added box:

    Vagrant.configure("2") do |config|
      config.vm.box = "precise32"
    end

Now, to open the Vagrant enviroment, you just call:

    vagrant up
