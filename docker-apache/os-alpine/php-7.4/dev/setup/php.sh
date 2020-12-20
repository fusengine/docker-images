#!/bin/ash

# Add script function
source /root/.script_base/base.sh

PHP="php"

# Version PHP Define
OPTION_REPOS_PHP_PATH=${OPTION_REPOS_PHP_PATH}
OPTION_REPOS_DIR_PATH=${OPTION_REPOS_DIR_PATH}

# add repositories
echo $OPTION_REPOS_PHP_PATH >> $OPTION_REPOS_DIR_PATH

# add packages
PACK_DEFAULT="
    apache-mod-fcgid imagemagick-dev imagemagick \
    argon2 argon2-dev libargon2 ttf-freefont fontconfig \

    $PHP $PHP-apache2 $PHP-apcu $PHP-amqp $PHP-pear $PHP-phar $PHP-cgi $PHP-fpm \
    $PHP-dev $PHP-doc $PHP-curl $PHP-gd $PHP-mbstring $PHP-intl \
    $PHP-mongodb $PHP-mysqli $PHP-sqlite3 $PHP-pdo_mysql $PHP-pdo_sqlite \
    $PHP-dom $PHP-calendar $PHP-xdebug $PHP-imap $PHP-session \
    $PHP-pspell $PHP-imagick $PHP-enchant $PHP-iconv $PHP-xmlrpc \
    $PHP-xsl $PHP-posix $PHP-exif $PHP-ftp $PHP-opcache $PHP-bcmath \
    $PHP-gettext $PHP-ctype $PHP-bz2 $PHP-xmlreader $PHP-zlib $PHP-sockets \
    $PHP-zip $PHP-soap $PHP-tidy $PHP-gmp $PHP-memcached $PHP-pcntl
"

# install pakage
install_pack

# symbolik links
ln -s /usr/bin/php7 /usr/bin/php

# Fix Error on php 7.3 pecl
#sed -i "php s|\-n||g" /usr/bin/pecl

# Configuration Apache part 2
sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php7/php.ini && \
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf

# add phpunit
apk add --update ca-certificates openssl && update-ca-certificates

wget https://phar.phpunit.de/phpunit.phar &&
    chmod +x phpunit.phar &&
    mv phpunit.phar /usr/local/bin/phpunit &&
    phpunit --version

# update and upgrade
update_sys

# clean system
clean