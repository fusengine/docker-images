FROM labengine/nodejs
MAINTAINER Fusengine <info@fusengine.ch>
ENV TERM dumb

# Update Ubuntu
RUN apt-get update \
    && apt-get install -y libfontconfig imagemagick

# Instal Bower
RUN npm install -g bower gulp gulp-cli browserify

# Update and Upgrade
RUN npm update upgrade

# clear npm
RUN npm cache clear

# Upgrade
RUN apt-get dist-upgrade -y && apt-get upgrade -y

# Autoremove Cleanup Purge
RUN apt-get autoremove \
    && apt-get purge \
    && apt-get clean

# add bowerrc
COPY .bowerrc /root/.bowerrc
RUN chmod 775 /root/.bowerrc

# Volume and workdir
VOLUME ["/data"]
WORKDIR /data

RUN bower --help
RUN browserify --help
