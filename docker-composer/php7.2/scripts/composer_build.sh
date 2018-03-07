#!/bin/ash

# Add script function
source /root/.script_base/base

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

# add repositories
echo "https://repos.php.earth/alpine/v3.7" >> /etc/apk/repositories

# add packages
PACK_DEFAULT="  subversion openssh openssl mercurial tini libmcrypt-dev subversion unzip \
                php7.2-composer php7.2-dom php7.2-xml php7.2-xmlwriter  php7.2-tokenizer \
                php7.2-mysqli php7.2-pdo_mysql php7.2-mysqlnd php7.2-pdo_sqlite php7.2-pdo
            "
# update
update

# install pakage
install_pack


# symbolik links
#ln -s /usr/bin/php7 /usr/bin/php

# Allow Composer to be run as root
curl -LsS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=$VERSION_COMPOSER
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
