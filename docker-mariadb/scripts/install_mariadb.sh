#!/bin/bash

# add script function
source /root/script_base.sh

# Version mariadb
MDB_VERSION=${MARIADB_VERSION}

# Add repos mariadb
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
echo "deb http://ftp.osuosl.org/pub/mariadb/repo/$MDB_VERSION/ubuntu trusty main" > /etc/apt/sources.list.d/mariadb.list

# add packages
PACKAGES_DEFAULT="mariadb-server"

# Update Ubuntu
update

# Install_packages
install_packages

# Delete /var/lib/mysql/*
rm -rf /var/lib/mysql/*

# Upgrade ubuntu
upgrade

# Clean ubuntu
clean_ubuntu

#change bind address to 0.0.0.0
sed -i -r 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/my.cnf

echo "Done ! next level is configure mariadb-server".
