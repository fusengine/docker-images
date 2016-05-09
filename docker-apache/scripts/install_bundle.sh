#!/bin/bash

# add script function
source /root/script_base.sh

# add packages
PACKAGES_DEFAULT=" apache2 libapache2-mod-php7.0 libphp7.0-embed php7.0-fpm \
                   php7.0-curl php7.0-gd php7.0-json php7.0-imap php7.0-mysql php7.0-sqlite3 \
                   php7.0-cgi php7.0-cli \

                   php7.0-phpdbg php7.0-common php7.0-dev php7.0-bcmath php7.0-interbase php7.0-gmp \
                   php7.0-mcrypt php7.0-intl php7.0-bz2 ssmtp php7.0-mbstring php7.0-imap php7.0-curl \

                   libphp7.0-embed php7.0-bz2 php7.0-zip \
                   php7.0-bcmath php7.0-interbase php7.0-gmp \

                   xfonts-utils xfonts-base xfonts-75dpi \
                   fontconfig libxrender1
                   "
# update
update

# Udapte ubuntu
install_packages


# Configuration Apache part 2
rm -rf /var/lib/apt/lists/* && \
a2enmod php7.0 && \
a2enmod rewrite && \
service apache2 stop


# If you want need Blackfire
# RUN curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/55\
#    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
#    && mv /tmp/blackfire-*.so `php -r "echo ini_get('extension_dir');"`/blackfire.so \
#    && echo "extension=blackfire.so\nblackfire.agent_socket=\${BLACKFIRE_PORT}" > /etc/php5/apache2/conf.d/blackfire.ini


# Configuration Apache part 2
 echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
      sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php/7.0/apache2/php.ini && \
      sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf


# install wkhtmltopdf
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
     dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
     rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

# Install PHPUNIT
echo "Install to phpunit --------->"
echo " "
wget https://phar.phpunit.de/phpunit.phar && \
   chmod +x phpunit.phar && \
   sudo mv phpunit.phar /usr/local/bin/phpunit && \
   phpunit --version
echo " "
echo " ===> Finish install phpunit <=== "

 # Upgrade ubuntu
 upgrade

# Clean ubuntu
 clean_ubuntu

# Create /app repertory and delete  /var/www/html
mkdir -p /app/web && rm -fr /var/www/html
chown www-data:www-data /app/web
echo " <----- Install good ! -----> "
