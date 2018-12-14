#!/bin/ash

# Add script function
source /root/.script_base/base

# add repositories
 echo "https://repos.php.earth/alpine/v3.8" >> /etc/apk/repositories

# Version PHP Define
PHP_VERSION=${PHP_VERSION}

# add packages
PACK_DEFAULT="  apache-mod-fcgid php$PHP_VERSION-apache2 php$PHP_VERSION php$PHP_VERSION-fpm php$PHP_VERSION-cgi php$PHP_VERSION-dev \
                php$PHP_VERSION-gd php$PHP_VERSION-mysqlnd php$PHP_VERSION-mysqli php$PHP_VERSION-common php$PHP_VERSION-curl php$PHP_VERSION-pear php$PHP_VERSION-pdo_mysql \

                php$PHP_VERSION-imap php$PHP_VERSION-session php$PHP_VERSION-mcrypt php$PHP_VERSION-pspell php$PHP_VERSION-phar php$PHP_VERSION-imagick php$PHP_VERSION-memcached php$PHP_VERSION-pdo \
                php$PHP_VERSION-calendar php$PHP_VERSION-exif php$PHP_VERSION-ftp php$PHP_VERSION-iconv php$PHP_VERSION-pdo_sqlite php$PHP_VERSION-posix \
                php$PHP_VERSION-sqlite3 php$PHP_VERSION-xmlrpc php$PHP_VERSION-mongodb php$PHP_VERSION-xsl php$PHP_VERSION-gettext php$PHP_VERSION-mbstring php$PHP_VERSION-openssl php$PHP_VERSION-ctype \
                php$PHP_VERSION-opcache php$PHP_VERSION-json php$PHP_VERSION-apcu php$PHP_VERSION-bz2 php$PHP_VERSION-sockets php$PHP_VERSION-zip  php$PHP_VERSION-bcmath \

                php$PHP_VERSION-zlib php$PHP_VERSION-xmlreader php$PHP_VERSION-xmlwriter php$PHP_VERSION-xml php$PHP_VERSION-simplexml php$PHP_VERSION-dom php$PHP_VERSION-fileinfo php$PHP_VERSION-intl \
                php$PHP_VERSION-tokenizer php$PHP_VERSION-tidy \

                php$PHP_VERSION-gmp php$PHP_VERSION-soap  libxrender ttf-freefont fontconfig
                "


# install pakage
install_pack

# symbolik links
#ln -s /usr/bin/php$PHP_VERSION /usr/bin/php

# Configuration Apache part 2
sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php/$PHP_VERSION/php.ini && \
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf

# Upgrade pear
pear channel-update pear.php.net
pear upgrade PEAR

# Upgrade Pecl
pecl channel-update pecl.php.net
pecl upgrade

# Add Xdebug
pecl install channel://pecl.php.net/xdebug-2.6.0alpha1

# add phpunit
apk add --update ca-certificates openssl && update-ca-certificates

wget https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit && \
    phpunit --version

# update and upgrade
update_sys

# clean system
clean