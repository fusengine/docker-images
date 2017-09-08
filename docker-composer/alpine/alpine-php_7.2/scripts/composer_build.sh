#!/bin/ash

# Add script function
source /root/.script_base/base

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

# add repositories
#echo "http://php.codecasts.rocks/7.1" >> /etc/apk/repositories
# Add script install php repos
#ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# add packages
PACK_DEFAULT="  subversion openssh openssl mercurial tini libmcrypt-dev subversion unzip \
                php7-zip php7-iconv php7-dom php7-zlib php7-pear php7-phar php7-ctype php7-session \
                php7-json php7-openssl php7-mbstring php7-xml php7-curl php7-pdo php7-dom php7-tokenizer
            "
# update
update

# install pakage
install_pack


# symbolik links
ln -s /usr/bin/php7 /usr/bin/php

# Allow Composer to be run as root
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$VERSION_COMPOSER
composer config --global

# Install symfony
echo "  Install Symfony installer "
load
curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# update and upgrade
update_sys

# clean system
clean
