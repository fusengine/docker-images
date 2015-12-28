FROM labengine/ubuntu-upstart
MAINTAINER Fusengine <info@fusengine.ch>

RUN figlet Fusengine mariadb OSX
#Added to avoid in container connection to the database with mysql client error message "TERM environment variable not set"
ENV TERM dumb
ENV MARIADB_VERSION 10.1
ENV MARIADB_PASS root
ENV MARIADB_USER root

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

# to add data on OSX
RUN usermod -u 1000 mysql

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
    echo "deb http://ftp.osuosl.org/pub/mariadb/repo/$MARIADB_VERSION/ubuntu trusty main" > /etc/apt/sources.list.d/mariadb.list

RUN apt-get update
RUN apt-get install mariadb-server -y && rm -rf /var/lib/mysql/*

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#change bind address to 0.0.0.0
RUN sed -i -r 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/my.cnf

COPY create_mariadb_admin_user.sh /create_mariadb_admin_user.sh
COPY run.sh /run.sh
RUN chmod 775 /*.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

CMD ["/run.sh"]
