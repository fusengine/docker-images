FROM labengine/alpine
LABEL maintainer="Fusengine <info@fusengine.ch>"

ENV EMAIL_APACHE "localhost"

# Add script
ADD scripts/build_apache2.sh /root/.install_http
RUN chmod +x /root/.install_http

RUN ./root/.install_http
ADD scripts/httpd.conf /etc/apache2/httpd.conf

# Expose port 80
EXPOSE 80

ADD scripts/run.sh /.httpd
RUN chmod +x /.httpd

# Volume
VOLUME ["/etc/apache2/vhost.d", "/var/log/apache2", "/app/web"]

# WORKDIR
WORKDIR /app/web

EXPOSE 80

CMD ["/.httpd"]
