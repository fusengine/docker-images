#!/bin/bash

# add script function
source /root/script_base.sh

VERSION_PROG=$VERSION_COMPOSER
TOCKEN=$TOKEN_GITHUB

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

version_installer(){
echo " "
echo  "Install:$PROG_NAME  $VERSION_PROG"
echo ""
}

# add packages
PACKAGES_DEFAULT="  php7.0-cli  libfreetype6-dev libmcrypt-dev \
                    libpng12-dev libbz2-dev php-pear subversion \
                    unzip php7.0-mbstring php7.0-curl php7.0-xml
                 "

# Update Ubuntu
update

# Install_packages
install_packages

version_installer

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$VERSION_COMPOSER
composer config --global github-oauth.github.com $TOKEN_GITHUB

# Install symfony
echo ""
echo "                     Install Symfony installer "
echo ""
curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# Upgrade ubuntu
upgrade

# Clean ubuntu
clean_ubuntu


# create data
echo ""
echo "                     Create data "
echo ""
mkdir -p /data

echo ""
echo "                     Complete "
echo ""
