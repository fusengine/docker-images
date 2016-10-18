#!/bin/bash

# add script function
source /root/script_base.sh

# add packages
PACKAGES_DEFAULT="apache2"

# update
update

# Udapte ubuntu
install_packages

# Configuration Apache part 2
 echo "ServerName localhost" >> /etc/apache2/apache2.conf
 chown -R www-data:www-data /var/www

# Upgrade ubuntu
 upgrade

# Clean ubuntu
 clean_ubuntu