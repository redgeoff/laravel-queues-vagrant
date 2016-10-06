Vagrant.configure("2") do |config|

  # We need this line or else supervisor won't be restarted when we restart our VM. See
  # http://unix.stackexchange.com/a/162938/168654
  config.vm.provision "shell", inline: "service supervisor restart", run: "always"

  config.vm.box = "ubuntu/trusty64"

  # Use a private network so that we don't have to worry about forwarding ports
  config.vm.network "private_network", ip: "192.168.50.11"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024

    # Only allow drift of 1 sec, instead of 20 min default
    v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
  end

  # Bootstrap script for configuring VM
  config.vm.provision :shell, path: "config/bootstrap.sh"

end
