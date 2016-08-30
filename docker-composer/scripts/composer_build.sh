#!/bin/bash

# add script function
source /root/script_base.sh

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

# add packages
PACKAGES_DEFAULT="  php7.0-cli php7.0-zip libfreetype6-dev libmcrypt-dev \
                    libpng12-dev libbz2-dev libxslt-dev php-pear subversion \
                    unzip php7.0-mbstring
                 "
# update
update

# Install_packages
install_packages

# Allow Composer to be run as root
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$VERSION_COMPOSER
composer config --global

# Install symfony
# echo ""
# echo "                     Install Symfony installer "
# echo ""
# curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
#    chmod a+x /usr/local/bin/symfony && \
#    symfony self-update

# Laravel
# echo""
# echo "                      Install Laravel Installer    "
# composer global require "laravel/installer"
# echo " alias laravel='~/.composer/vendor/bin/laravel' " >> ~/.bashrc
# export PATH="$PATH:$HOME/.composer/vendor/bin"

# Upgrade System
upgrade

# Clean System
clean_ubuntu