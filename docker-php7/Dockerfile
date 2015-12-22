FROM labengine/ubuntu-upstart
MAINTAINER Fusengine <info@fusengine.ch>



# Add Key to php7 && Add repos to install php 7
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0x4f4ea0aae5267a6c && \
    echo "deb http://ppa.launchpad.net/ondrej/php-7.0/ubuntu trusty main" > /etc/apt/sources.list.d/php7.list

# Udapte Ubuntu to add repos
RUN apt-get update

# Install php7
RUN apt-get install -y \
            php7.0 \
            apache2

RUN a2enmod php7.0

# Update system
RUN apt-get dist-upgrade -y

# Cleanup
RUN apt-get clean

# Add image configuration and scripts
ADD apache.sh /apache.sh
RUN chmod 755 /*.sh

# Add php info
RUN rm -fr /var/www/html/index.html
ADD index.php /var/www/html

# Volume
VOLUME ["/var/www/html"]

# Expose EXPOSE
EXPOSE 80

#start apache2
CMD ["/apache.sh"]
