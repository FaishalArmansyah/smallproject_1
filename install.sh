#!/bin/bash
echo "===== Installasi LAMP & Wordpress ====="
echo "===== Step 1 - Install Apache ====="
sudo apt update
sudo apt install -y apache2 apache2-utils
sudo systemctl start apache2 && sudo systemctl enable apache2
echo "===== Step 2 - Install MariaDB ====="
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb && sudo systemctl enable mariadb
echo "===== Step 3 - Install PHP 7.4 ====="
sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline -y
sudo a2enmod php7.4
sudo systemctl restart apache2
echo "===== Step 4 - Download Wordpress ====="
#git clone https://github.com/FaishalArmansyah/smallproject_1.git
sudo cp -r smallproject_1/wordpress /var/www/
sudo chown www-data:www-data /var/www/wordpress/ -R
sudo cp smallproject_1/wordpress/wordpress.conf /etc/apache2/sites-available/
sudo cp smallproject_1/wordpress/servername.conf /etc/apache2/conf-available/
sudo a2enconf servername.conf && sudo a2ensite wordpress.conf && sudo a2dissite 000-default.conf
echo "===== Step 5 - Create DB & UserDB ====="
sudo mysql -u root -e "create database wordpress;"
sudo mysql -u root -e "grant all privileges on wordpress.* to wpuser@localhost identified by '12345678';"
sudo mysql -u root -e "flush privileges;"
echo "===== Step 6 - Finishing ====="
sudo systemctl restart apache2
echo "===== Completed ====="
