#!/bin/bash

# add script function
source /root/script_base.sh

# add packages
PACKAGES_DEFAULT=" nginx \
                   php7.0 php7.0-fpm php7.0-mcrypt php7.0-curl php7.0-gd php7.0-mysql \
                   mysql-client
                   "

# update
update

# Udapte ubuntu
install_packages
