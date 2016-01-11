FROM fusengine/apache-php
MAINTAINER Fusengine <info@fusengine.ch>

ENV OWNCLOUD_VERSION 8.2.2
ENV OWNCLOUD_LINKS https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.bz2
ENV OWNCLOUD_ASC https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.asc

#gpg key from https://owncloud.org/owncloud.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys E3036906AD9F30807351FAC32D5D5E97F6978A26
RUN a2enmod rewrite && \
    a2enmod ssl

RUN make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/ssl/private/localhost.pem
COPY sites-available/*.conf /etc/apache2/sites-available/
RUN service apache2 restart

RUN curl -k ${OWNCLOUD_LINKS} | tar jx -C /app
RUN mkdir /app/owncloud/data

EXPOSE 80 443
CMD ["/start_apache.sh"]
