#!/bin/bash
echo "===== 1. Installasi MySQL ====="
sudo apt update
sudo apt install mariadb-server mariadb-client -y
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
sudo systemctl enable mariadb && sudo systemctl restart mariadb
echo "===== 2. Create DB & UserDB ====="
sudo mysql -u root -e "create database dbsosmed;"
sudo mysql -u root -e "grant all privileges on dbsosmed.* to 'devopscilsy'@'%' identified by '1234567890';"
sudo mysql -u root -e "flush privileges;"
echo "===== 3. Restore DB ====="
mysql -u root dbsosmed < smallproject_1/sosial-media/dump.sql
echo "===== Completed =====" 
