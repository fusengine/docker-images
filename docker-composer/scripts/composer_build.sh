#!/bin/bash

# add script function
source /root/script_base.sh

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

# add packages
PACKAGES_DEFAULT="  php7.1-cli php7.1-zip libfreetype6-dev libmcrypt-dev \
                    libpng12-dev libbz2-dev libxslt-dev php-pear subversion \
                    unzip php7.1-mbstring php7.1-xml php7.1-curl
                 "
# update
update

# Install_packages
install_packages

# Allow Composer to be run as root
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$VERSION_COMPOSER
composer config --global

# Upgrade System
upgrade

# Clean System
clean_ubuntu