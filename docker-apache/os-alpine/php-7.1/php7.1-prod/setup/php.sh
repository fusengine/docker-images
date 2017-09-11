#!/bin/ash

# Add script function
source /root/.script_base/base


# hold  add repositories
#wget -O /etc/apk/keys/php-alpine.rsa.pub http://php.codecasts.rocks/php-alpine.rsa.pub
#echo "http://php.codecasts.rocks/v3.6/php-7.1" >> /etc/apk/repositories

# add repositories
echo "https://repos.php.earth/alpine" >> /etc/apk/repositories

# add packages
PACK_DEFAULT="  apache-mod-fcgid php7.1-apache2 php7.1 php7.1-fpm php7.1-cgi php7.1-dev \
                php7.1-gd php7.1-mysqlnd php7.1-mysqli php7.1-common php7.1-curl php7.1-pear php7.1-pdo_mysql \

                php7.1-imap php7.1-session php7.1-mcrypt php7.1-pspell php7.1-phar php7.1-imagick php7.1-memcached php7.1-pdo \
                php7.1-calendar php7.1-exif php7.1-ftp php7.1-iconv php7.1-pdo_sqlite php7.1-posix \
                php7.1-sqlite3 php7.1-xmlrpc php7.1-xsl php7.1-gettext php7.1-mbstring php7.1-openssl php7.1-ctype \
                php7.1-opcache php7.1-json php7.1-apcu php7.1-bz2 php7.1-sockets php7.1-zip  php7.1-bcmath \

                php7.1-zlib php7.1-xmlreader php7.1-xmlwriter php7.1-xml php7.1-simplexml php7.1-dom php7.1-fileinfo php7.1-intl \
                php7.1-tokenizer php7.1-tidy \

                php7.1-gmp php7.1-xdebug php7.1-soap  libxrender ttf-freefont fontconfig
                "


# install pakage
install_pack

# symbolik links
#ln -s /usr/bin/php/7.1 /usr/bin/php

# Configuration Apache part 2 
sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php/7.1/php.ini && \
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf

# Xdebug config
#rm -rf /etc/php7.1/conf.d/xdebug.ini

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