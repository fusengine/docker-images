FROM fusengine/nginx
MAINTAINER Fusengine <info@fusengine.ch>

# Env Version and language
ENV WORDPRESS_VERSION 4.5.2
ENV WORDPRESS_LANG fr_FR

# nginx default
ADD nginx/default /etc/nginx/sites-enabled/default

# /wordpress/ so this gives us /usr/src/wordpress
ADD https://fr.wordpress.org/wordpress-${WORDPRESS_VERSION}-${WORDPRESS_LANG}.zip /
RUN unzip wordpress-${WORDPRESS_VERSION}-${WORDPRESS_LANG}.zip && \
 	rm -fr wordpress-${WORDPRESS_VERSION}-${WORDPRESS_LANG}.zip && \
    chown -R www-data:www-data /wordpress

# To configur host
# VOLUME /etc/nginx/sites-enabled/

# Wordpress Directory
WORKDIR /wordpress

# expose port
EXPOSE 80
