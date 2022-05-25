#!/bin/bash
echo "===== 1. Installasi MySQL ====="
sudo apt install mariadb-server mariadb-client -y
sudo systemctl start mariadb && sudo systemctl enable mariadb
echo "===== 2. Create DB & UserDB ====="
sudo mysql -u root -e "create database dbsosmed;"
sudo mysql -u root -e "grant all privileges on wordpress.* to devopscilsy@localhost identified by '1234567890';"
sudo mysql -u root -e "flush privileges;"
echo "===== 3. Restore DB ====="
mysql -u root dbsosmed < smallproject_1/sosial-media/dump.sql
echo "===== Completed ====="
