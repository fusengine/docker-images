#!/bin/bash

# add script function
source /root/script_base.sh

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

version_installer(){
echo " "
echo  "Install:$PROG_NAME  $VERSION_PROG"
echo ""
}

# add packages
PACKAGES_DEFAULT="  php7.0-cli php7.0-zip libfreetype6-dev libmcrypt-dev \
                    libpng12-dev libbz2-dev php-pear subversion \
                    unzip php7.0-mbstring
                 "
# update
update

# Install_packages
install_packages

# version Install
version_installer

# Allow Composer to be run as root
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$VERSION_COMPOSER
composer config --global


# Install symfony
echo ""
echo "                     Install Symfony installer "
echo ""
curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# Laravel
echo""
echo "                      Install Laravel Installer    "
composer global require "laravel/installer"
echo " alias laravel='~/.composer/vendor/bin/laravel' " >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc


# Upgrade System
upgrade

# Clean System
clean_ubuntu