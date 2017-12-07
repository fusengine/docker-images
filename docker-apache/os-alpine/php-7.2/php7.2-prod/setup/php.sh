#!/bin/ash

# Add script function
source /root/.script_base/base

# add repositories
 echo "https://repos.php.earth/alpine/v3.7" >> /etc/apk/repositories

# add packages
PACK_DEFAULT="  apache-mod-fcgid php7.2-apache2 php7.1 php7.2-fpm php7.2-cgi php7.2-dev \
                php7.2-gd php7.2-mysqlnd php7.2-mysqli php7.2-common php7.2-curl php7.2-pear php7.2-pdo_mysql \

                php7.2-imap php7.2-session php7.2-mcrypt php7.2-pspell php7.2-phar php7.2-imagick php7.2-memcached php7.2-pdo \
                php7.2-calendar php7.2-exif php7.2-ftp php7.2-iconv php7.2-pdo_sqlite php7.2-posix \
                php7.2-sqlite3 php7.2-xmlrpc php7.2-xsl php7.2-gettext php7.2-mbstring php7.2-openssl php7.2-ctype \
                php7.2-opcache php7.2-json php7.2-apcu php7.2-bz2 php7.2-sockets php7.2-zip  php7.2-bcmath \

                php7.2-zlib php7.2-xmlreader php7.2-xmlwriter php7.2-xml php7.2-simplexml php7.2-dom php7.2-fileinfo php7.2-intl \
                php7.2-tokenizer php7.2-tidy \

                php7.2-gmp php7.2-soap  libxrender ttf-freefont fontconfig
                "


# install pakage
install_pack

# symbolik links
#ln -s /usr/bin/php7.2 /usr/bin/php

# Configuration Apache part 2
sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php/7.2/php.ini && \
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/httpd.conf

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