FROM labengine/ubuntu-upstart
MAINTAINER Fusengine <info@fusengine.ch>
LABEL version.apache2.php5 1.0

# FIX Apache/PHP write permissions to the app
ENV OSX_BOOT2DOCKER_ID 1000
ENV OSX_BOOT2DOCKER_GID 50
ENV OSX_BOOT2DOCKER_ID 1000

RUN usermod -u ${OSX_BOOT2DOCKER_ID} www-data && \
    usermod -G staff www-data
RUN groupmod -g $(($OSX_BOOT2DOCKER_GID + 10000)) $(getent group $OSX_BOOT2DOCKER_GID | cut -d: -f1)
RUN groupmod -g ${OSX_BOOT2DOCKER_GID} staff

# Update ubuntu-upstart
RUN apt-get update

# install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install \
          imagemagick \
          apache2 \
          php5-common \
          libapache2-mod-php5 \
          php5-cli \
          php5-apcu \
          php5-readline \
          phpapi-20121212 \
          php5-mysql \
          php5-gd \
          php5-curl \
          php5-mcrypt \
          php-apc \
          php5-imagick \
          php5-dev \
          ssmtp \
          && \
    rm -rf /var/lib/apt/lists/* && \
    php5enmod mcrypt && \
    a2enmod rewrite && \
    service apache2 stop

# If you want need Blackfire
# RUN curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/55\
#    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
#    && mv /tmp/blackfire-*.so `php -r "echo ini_get('extension_dir');"`/blackfire.so \
#    && echo "extension=blackfire.so\nblackfire.agent_socket=\${BLACKFIRE_PORT}" > /etc/php5/apache2/conf.d/blackfire.ini

# Configuration Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini && \
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

# wkhtmltopdf
RUN apt-get update && \
    apt-get install -y \
        xfonts-utils \
        xfonts-base \
        xfonts-75dpi \
        && \
    wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

# Rerun update and upgrade ubuntu-upstart
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

# Create /app repertory and delete  /var/www/html
RUN mkdir -p /app/web && rm -fr /var/www/html
RUN chown www-data:www-data /app/web

# Add apaxy and adminer
ADD config/apaxy/ /app

# Add conf files to work /app
ADD config/sites-enable/000-default.conf /etc/apache2/sites-enabled/
ADD config/sites-available/000-default.conf /etc/apache2/sites-available/
ADD config/apache2.conf /etc/apache2/

# Add image configuration and scripts
ADD apache.sh /apache.sh
RUN chmod 755 /*.sh

# Volume
VOLUME ["/etc/apache2/sites-enabled", "/var/log/apache2", "/app/web"]

# Work directory
WORKDIR /app/web

# Expose port
EXPOSE 80

#start apache2
CMD ["/apache.sh"]
