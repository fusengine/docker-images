FROM labengine/ubuntu
MAINTAINER Fusengine <info@fusengine.ch>

# Add config script to install apache2
COPY setup/scripts/install_apache2.sh /root/.install_apache2
RUN chmod +x /root/.install_apache2

# Starting script install
RUN ./root/.install_apache2

# Add config apache2
COPY setup/config/apache2/sites-enable/000-default.conf /etc/apache2/sites-enabled/ 
COPY setup/config/apache2/sites-available/000-default.conf /etc/apache2/sites-available/
COPY setup/config/apache2/apache2.conf /etc/apache2/

# Add apaxy
COPY setup/config/apaxy-v2/ /app/
#COPY setup/config/apaxy/ /usr/share/apache2/
#COPY setup/config/apache2/apaxy.conf /etc/apache2/mods-enabled/apaxy.conf 

# Starting apache2 script
COPY setup/scripts/run /.run
RUN chmod +x /.run
# RUN mkdir /app/web/test && \
#  cd /app/web/ && \
#  touch test.html test.php test.rb test.mp3 test.md test.xml test.sql

# Volume
VOLUME ["/etc/apache2/sites-enabled", "/var/log/apache2", "/app/web"]

# WORKDIR
WORKDIR /app/web

# Expose port 80
EXPOSE 80

# Expose port 80
EXPOSE 80

CMD "/.run"