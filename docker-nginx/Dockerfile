FROM labengine/ubuntu-xenial
MAINTAINER Fusengine <info@fusengine.ch>

RUN apt update && apt install -y php7.0-fpm nginx

# Add buildpack
ADD scripts/ /root
RUN chmod 775 /root/*.sh

# Run buildpack
RUN ./root/nginx_php.sh

# nginx default
ADD nginx/default /etc/nginx/sites-enabled/default

# add html
ADD index.php /var/www/html/index.php
RUN rm -rf /var/www/html/*.html

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

# Add volume to web directory
VOLUME ["/var/www/html", "/etc/nginx/sites-enabled/"]

# expose port
EXPOSE 80 443

# Command to run nginx and php7.0-fpm
CMD /bin/bash -c "service php7.0-fpm start; nginx -g 'daemon off;'"
