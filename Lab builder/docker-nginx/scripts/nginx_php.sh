#!/bin/bash

# add script function
source /root/script_base.sh

# add packages
PACKAGES_DEFAULT=" nginx \
                   php7.0-fpm php7.0-mcrypt php7.0-curl php7.0-gd php7.0-mysql \

                   php7.0-cli php7.0-common php-common \
                   libgd-tools geoip-bin fcgiwrap nginx-doc ssl-cert php-pear \

                   php7.0-gd php7.0-bcmath \

                   php7.0-bz2 php7.0-cgi php7.0-gmp php7.0-imap php7.0-interbase \
                   php7.0-intl php7.0-json php7.0-mbstring php7.0-odbc php7.0-opcache \
                   php7.0-pgsql php7.0-phpdbg php7.0-pspell php7.0-readline php7.0-recode\
                   php7.0-soap php7.0-sqlite3 php7.0-sybase php7.0-tidy \
                   php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip \

                   mysql-client
                   "

# update
update

# Install_packages
install_packages

# Upgrade System
upgrade

# Clean System
clean_ubuntu
