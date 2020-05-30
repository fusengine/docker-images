#!/bin/ash

# Add script function
source /root/.script_base/base.sh

# Version PHP Define
OPTION_REPOS_PHP_PATH=${OPTION_REPOS_PHP_PATH}
OPTION_REPOS_DIR_PATH=${OPTION_REPOS_DIR_PATH}

# add repositories
echo $OPTION_REPOS_PHP_PATH >> $OPTION_REPOS_DIR_PATH

# add packages
PACK_DEFAULT="
    apache-mod-fcgid imagemagick-dev imagemagick \
    argon2 argon2-dev libargon2 ttf-freefont fontconfig \

    php php-apache2 php-apcu php-amqp php-pear php-phar php-cgi php-fpm \
    php-dev php-doc php-curl php-gd php-mbstring php-intl \
    php-mongodb php-mysqli php-sqlite3 php-pdo_mysql php-pdo_sqlite \
    php-dom php-calendar php-xdebug php-imap php-session \
    php-pspell php-imagick php-enchant php-iconv php-xmlrpc \
    php-xsl php-posix php-exif php-ftp php-opcache php-bcmath \
    php-gettext php-ctype php-bz2 php-xmlreader php-zlib php-sockets \
    php-zip php-soap php-tidy php-gmp php-memcached php7-pcntl
"

# install pakage
install_pack

# symbolik links
ln -s /usr/bin/php7 /usr/bin/php

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