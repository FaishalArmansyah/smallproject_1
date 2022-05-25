Vagrant.configure("2") do |config|

  config.vm.define "reverseproxy_new-svr" do |web1|
    web1.vm.box = "ubuntu/focal64"
    #for landing-page
    web1.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "192.168.100.51"
    #for wordpress
    web1.vm.network "forwarded_port", guest: 9090, host: 9090, host_ip: "192.168.100.51"
    #for social-media
    web1.vm.network "forwarded_port", guest: 8100, host: 8100, host_ip: "192.168.100.51"
    web1.vm.network "private_network", ip: "192.168.56.5"
    web1.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "reverseproxy-svr"
      vb.cpus = "1"
      vb.memory = "1024"
    end
    web1.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y nginx
      cd /etc/nginx/conf.d && wget https://raw.githubusercontent.com/FaishalArmansyah/smallproject_1/main/web-proxy/web-proxy.conf
      sudo systemctl restart nginx
    SHELL
  end
  #---------- landing-page ----------
  config.vm.define "landingpage-svr" do |web2|
    web2.vm.box = "ubuntu/focal64"
    web2.vm.network "private_network", ip: "192.168.56.8"
    web2.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "landingpage-svr"
      vb.cpus = "1"
      vb.memory = "1024"
    end
    web2.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y apache2
      git clone https://github.com/FaishalArmansyah/smallproject_1.git
      cd smallproject_1/ && cd landing-page-master/
      cp -r * /var/www/html/
      systemctl restart apache2
    SHELL
  end
  #---------- wordpress ----------
  config.vm.define "wordpress-svr" do |web3|
    web3.vm.box = "ubuntu/focal64"
    web3.vm.network "private_network", ip: "192.168.56.9"
    web3.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "wordpress-svr"
      vb.cpus = "1"
      vb.memory = "1024"
    end
    web3.vm.provision "shell", inline: <<-SHELL 
      echo "== git clone =="
      git clone https://github.com/FaishalArmansyah/smallproject_1.git
      echo "== running shell  script =="
      sudo bash smallproject_1/install-wordpress.sh
    SHELL
  end
  #---------- app_social-media ----------
  config.vm.define "appsosmed-svr" do |web4|
    web4.vm.box = "ubuntu/focal64"
    web4.vm.network "private_network", ip: "192.168.56.10"
    web4.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "appsosmed-svr"
      vb.cpus = "1"
      vb.memory = "1024"
    end
    web4.vm.provision "shell", inline: <<-SHELL
      echo "== git clone =="
      git clone https://github.com/FaishalArmansyah/smallproject_1.git
      echo "== running shell  script =="
      sudo bash smallproject_1/install-app_sosmed.sh
    SHELL
  end
  #---------- db_social-media ----------
  config.vm.define "dbsosmed-svr" do |web5|
    web5.vm.box = "ubuntu/focal64"
    web5.vm.network "private_network", ip: "192.168.56.11"
    web5.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.name = "dbsosmed-svr"
      vb.cpus = "1"
      vb.memory = "1024"
    end
    web5.vm.provision "shell", inline: <<-SHELL
      echo "== git clone =="
      git clone https://github.com/FaishalArmansyah/smallproject_1.git
      echo "== running shell  script =="
      sudo bash smallproject_1/install-app_sosmed.sh
    SHELL
  end
  
end
