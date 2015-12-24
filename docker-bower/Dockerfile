FROM labengine/nodejs
MAINTAINER Fusengine <info@fusengine.ch>

RUN figlet FUSENGINE Bower

# Update Ubuntu & Intall Nodejs
RUN apt-get update

# Instal Bower
RUN npm install -g bower

# Upgrade
RUN apt-get dist-upgrade -y && apt-get upgrade -y

# Cleanup
RUN apt-get clean

# add bowerrc
COPY .bowerrc /root/.bowerrc
RUN chmod 775 /root/.bowerrc

# Work directory
WORKDIR /data

# version Nodejs
RUN bower help
