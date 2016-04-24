FROM ubuntu:xenial
MAINTAINER Fusengine <info@fusengine.ch>

RUN apt update && apt install -y php7.0-fpm nginx

ADD php/php.ini /etc/php5/fpm/php.ini
ADD nginx/default /etc/nginx/sites-enabled/default
ADD start.sh /start.sh

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
