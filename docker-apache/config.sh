echo ''
echo '                    Update ubuntu-upstart '
echo ''
# Udapte Ubuntu to add repos
apt-get update

echo ''
echo '                    Install packages php7                      '
echo ''
# Install php7
apt-get install -y imagemagick apache2 php7.0 libapache2-mod-php7.0 libphp7.0-embed php7.0-dbg \
                   php7.0-curl php7.0-gd php7.0-json php7.0-imap php7.0-mysql php7.0-sqlite3 \
                   php7.0-modules-source php7.0-phpdbg php7.0-fpm php7.0-dev php7.0-common php-all-dev \
                   php7.0-mcrypt ssmtp \
            && \
rm -rf /var/lib/apt/lists/* && \
a2enmod php7.0 && \
a2enmod rewrite && \
service apache2 stop


# If you want need Blackfire
# RUN curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/55\
#    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
#    && mv /tmp/blackfire-*.so `php -r "echo ini_get('extension_dir');"`/blackfire.so \
#    && echo "extension=blackfire.so\nblackfire.agent_socket=\${BLACKFIRE_PORT}" > /etc/php5/apache2/conf.d/blackfire.ini

echo ''
echo '                    Configuration Apache                    '
echo ''
# Configuration Apache
 echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
  sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php/7.0/apache2/php.ini && \
  sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

echo ''
echo '                 Install wkhtmltopdf                     '
echo ''
# wkhtmltopdf
apt-get update
apt-get install -y xfonts-utils xfonts-base xfonts-75dpi \
                   fontconfig libxrender1

wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb


echo ''
echo '                 Upgrade ubuntu-upstart                       '
echo ''
# Rerun update and upgrade ubuntu-upstart
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y


echo ''
echo '                  Cleanup                      '
echo ''
# Cleanup
apt-get clean


echo ''
echo '               Create /app repertory and delete  /var/www/html                      '
echo ''
# Create /app repertory and delete  /var/www/html
mkdir -p /app/web && rm -fr /var/www/html
chown www-data:www-data /app/web


echo ''
echo '                        Install complete                            '
