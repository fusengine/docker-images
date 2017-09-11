#!/bin/ash

# Add script function
source /root/.script_base/base

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

# add repositories
echo "https://repos.php.earth/alpine" >> /etc/apk/repositories

# add packages
PACK_DEFAULT="  subversion openssh openssl mercurial tini libmcrypt-dev subversion unzip \
                php7.1-zip php7.1-iconv php7.1-dom php7.1-zlib php7.1-pear php7.1-phar php7.1-ctype php7.1-session \
                php7.1-json php7.1-openssl php7.1-mbstring php7.1-xml php7.1-curl php7.1-pdo php7.1-dom php7.1-tokenizer
            "
# update
update

# install pakage
install_pack


# symbolik links
#ln -s /usr/bin/php7 /usr/bin/php

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
