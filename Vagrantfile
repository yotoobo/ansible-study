Vagrant.configure(2) do |config|

  config.vm.box = "centos72"

  config.vm.provider "virtualbox" do |v|
    v.memory = "1024"
    v.cpus = "2"
  end

  config.vm.define :master do |m1|
    m1.vm.hostname = "master"
    m1.vm.network :private_network, ip: "10.0.10.3"
    # config.vm.network "forwarded_port", guest: 80, host: 8080
    m1.vm.provision "foo", type: "shell",
      inline: "yum makecache fast && yum -y install ansible"
  end

  config.vm.define :node1 do |n1|
    n1.vm.hostname = "node1"
    n1.vm.network :private_network, ip: "10.0.10.4"
    # config.vm.network "forwarded_port", guest: 80, host: 8080
  end

  config.vm.define :node2 do |n2|
    n2.vm.hostname = "node2"
    n2.vm.network :private_network, ip: "10.0.10.5"
    # config.vm.network "forwarded_port", guest: 80, host: 8080
  end

end
