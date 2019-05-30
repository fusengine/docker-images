#!/bin/ash

# Add script function
source /root/.script_base/base.sh

# Version PHP Define
PHP_VERSION=${PHP_VERSION}
OPTION_REPOS_PHP_PATH=${OPTION_REPOS_PHP_PATH}
OPTION_REPOS_DIR_PATH=${OPTION_REPOS_DIR_PATH}

# env composer
VERSION_COMPOSER=${COMPOSER_VERSION}

# add repositories
echo $OPTION_REPOS_PHP_PATH >>$OPTION_REPOS_DIR_PATH

# add repositories
echo "https://repos.php.earth/alpine/v3.9" >> /etc/apk/repositories

# add packages
PACK_DEFAULT="  subversion openssh openssl mercurial tini libmcrypt-dev subversion unzip \
                php$PHP_VERSION-zip  php$PHP_VERSION-iconv php$PHP_VERSION-dom php$PHP_VERSION-zlib php$PHP_VERSION-pear php$PHP_VERSION-phar php$PHP_VERSION-ctype php$PHP_VERSION-session \
                php$PHP_VERSION-json php$PHP_VERSION-openssl php$PHP_VERSION-mbstring php$PHP_VERSION-xml php$PHP_VERSION-curl php$PHP_VERSION-pdo php$PHP_VERSION-dom php$PHP_VERSION-tokenizer \
                php$PHP_VERSION-mysqli php$PHP_VERSION-pdo_mysql php$PHP_VERSION-mysqlnd php$PHP_VERSION-pdo_sqlite php$PHP_VERSION-pdo php$PHP_VERSION-xmlwriter
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

# update and upgrade
update_sys

# clean system
clean
