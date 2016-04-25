FROM fusengine/nginx
MAINTAINER Fusengine <info@fusengine.ch>

ENV WORDPRESS_VERSION 4.5

# nginx default
ADD nginx/default /etc/nginx/sites-enabled/default

# /wordpress/ so this gives us /usr/src/wordpress
ADD https://fr.wordpress.org/wordpress-${WORDPRESS_VERSION}-fr_FR.zip /
RUN unzip wordpress-4.5-fr_FR.zip && \
 	 rm -fr wordpress-4.5-fr_FR.zip && \
    chown -R www-data:www-data /wordpress

# To configur host
# VOLUME /etc/nginx/sites-enabled/

# Wordpress Directory
WORKDIR /wordpress

# expose port
EXPOSE 80
