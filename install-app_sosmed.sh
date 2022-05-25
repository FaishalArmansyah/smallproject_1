#!/bin/bash
echo "== git clone =="
git clone https://github.com/FaishalArmansyah/smallproject_1.git
echo "===== Installasi Apache & PHP ====="
echo "===== Step 1 - Install Apache ====="
sudo apt update
sudo apt install -y apache2 apache2-utils
sudo systemctl start apache2 && sudo systemctl enable apache2
echo "===== Step 2 - Install PHP 7.4 ====="
sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline -y
sudo a2enmod php7.4
sudo systemctl restart apache2
echo "===== Step 3 - Download App ====="
#git clone https://github.com/FaishalArmansyah/smallproject_1.git
sudo cp -r smallproject_1/sosial-media /var/www/
#sudo chown www-data:www-data /var/www/sosial-media/ -R
sudo cp smallproject_1/sosial-media/sosmed.conf /etc/apache2/sites-available/
sudo cp smallproject_1/sosial-media/servername.conf /etc/apache2/conf-available/
sudo a2enconf servername.conf && sudo a2ensite sosmed.conf && sudo a2dissite 000-default.conf
sudo systemctl restart apache2
echo "===== Completed ====="
