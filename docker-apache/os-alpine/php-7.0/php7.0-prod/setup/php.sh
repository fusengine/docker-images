#!/bin/ash

# Add script function
source /root/.script_base/base


# hold  add repositories
#wget -O /etc/apk/keys/php-alpine.rsa.pub http://php.codecasts.rocks/php-alpine.rsa.pub
#echo "http://php.codecasts.rocks/v3.6/php-7.0" >> /etc/apk/repositories

# add repositories
echo "https://repos.php.earth/alpine/v3.7" >> /etc/apk/repositories

# add packages
PACK_DEFAULT="  apache-mod-fcgid php7.0-apache2 php7.0 php7.0-fpm php7.0-cgi php7.0-dev \
                php7.0-gd php7.0-mysqlnd php7.0-mysqli php7.0-common php7.0-curl php7.0-pear php7.0-pdo_mysql \

                php7.0-imap php7.0-session php7.0-mcrypt php7.0-pspell php7.0-phar php7.0-imagick php7.0-memcached php7.0-pdo \
                php7.0-calendar php7.0-exif php7.0-ftp php7.0-iconv php7.0-pdo_sqlite php7.0-posix \
                php7.0-sqlite3 php7.0-xmlrpc php7.0-xsl php7.0-gettext php7.0-mbstring php7.0-openssl php7.0-ctype \
                php7.0-opcache php7.0-json php7.0-apcu php7.0-bz2 php7.0-sockets php7.0-zip  php7.0-bcmath \

                php7.0-zlib php7.0-xmlreader php7.0-xmlwriter php7.0-xml php7.0-simplexml php7.0-dom php7.0-fileinfo php7.0-intl \
                php7.0-tokenizer php7.0-tidy \

                php7.0-gmp php7.0-xdebug php7.0-soap  libxrender ttf-freefont fontconfig
                "


# install pakage
install_pack

# symbolik links
#ln -s /usr/bin/php/7.0.1 /usr/bin/php

# Configuration Apache part 2 
sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php/7.0/php.ini && \
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf

# Xdebug config
#rm -rf /etc/php7.0/conf.d/xdebug.ini

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