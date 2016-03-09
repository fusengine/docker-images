FROM labengine/ubuntu-upstart
MAINTAINER Fusengine <info@fusengine.ch>

RUN figlet Fusengine php7
# Udapte Ubuntu to add repos
RUN apt-get update

# Install php7
RUN apt-get install -y \
            php7.0 \
            apache2

RUN a2enmod php7.0

# Clean Ubuntu
RUN apt-get clean

# Add image configuration and scripts
COPY apache.sh /
RUN chmod 755 /*.sh

# Add php info
RUN rm -fr /var/www/html/index.html
COPY index.php /var/www/html/index.php

# Volume
VOLUME ["/var/www/html"]

# Expose EXPOSE
EXPOSE 80

#start apache2
CMD ["/apache.sh"]
