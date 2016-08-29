FROM labengine/ubuntu
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.1.2
ENV COMPOSER_ALLOW_SUPERUSER 1

# Add buildpack
COPY scripts/composer_build.sh /
RUN chmod 775 /*.sh

# Run buildpack
RUN ./composer_build.sh

# Volume mount
VOLUME ["/root/.composer"]

# Display version information.
RUN composer --version