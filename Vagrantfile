Vagrant.configure("2") do |config|
    # configure vagrant box to Ubuntu 18.04
    config.vm.box = "ubuntu/bionic64"

    # sync all folders to VM
    config.vm.synced_folder "app_code/", "/home/vagrant/app_code"

    # run provision bash script
    config.vm.provision "shell", path:"vagrant_provisions/provision.sh"

end