# Creating a development environment

To ensure we are all working within the same environment, we use Vagrant to provision development environments.

To begin, go to the [downloads](http://www.vagrantup.com/downloads) page and install the correct version of Vagrant for your machine.

We're also going to be using VirtualBox, so go to the [downloads](https://www.virtualbox.org/) page and install it if you haven't already done so.

You can either clone the repo into a directory, or follow the steps below to accomplish the same thing.

First, create a directory where your want your Vagrant files to live.

	$ cd ~/Haxicon
	$ mkdir vagrant-scripts
	$ cd vagrant-scripts

Now we create the Vagrantfile:

	$ vagrant init

Download a virtual machine box:

	$ vagrant box add hashicorp/precise32

Modify the Vagrantfile that was created so that it only reads:

	Vagrant.configure(2) do |config|
  		config.vm.box = "hashicorp/precise32"
  		config.vm.provision "shell", path: "haskell-setup.sh"
  		config.vm.synced_folder "..", "/Haxicon"
	end

Now get the virtual machine running:

	$ vagrant up

And ssh into the machine from the directory:

	$ vagrant ssh
	
Some commands don't work when placed in haskell-setup.sh, so you'll have to run the following commands manually:
	
	$ cabal update
	$ cabal install Cabal cabal-install
	$ export PATH=$HOME/.cabal/bin:$PATH
	$ cabal install hspec

If everything works, `exit` out of your virtual machine and then run:

	$ vagrant destroy

To ensure everything worked, SSH back into your virtual machine and run the following:

	$ ghci --version

If the command returns a version, everything should be good to go.

When you are in the Vagrant environment, all Haxicon files will live in /Haxicon.
