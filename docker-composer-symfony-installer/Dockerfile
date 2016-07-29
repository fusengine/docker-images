FROM labengine/ubuntu
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.1.2
ENV GITHUB_TOKEN 8a2c6f02975e1f06a9e64a8dcba95f3faf344b1c

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Add buildpack
COPY setup.sh /
RUN chmod 775 /*.sh

# Run buildpack
RUN ./setup.sh

# Volume mount
VOLUME ["/data", "/root/.composer"]

# Work directory
WORKDIR /data

# Composer & symfony command
RUN composer && symfony
