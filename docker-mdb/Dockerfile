FROM labengine/ubuntu-xenial
MAINTAINER Fusengine <info@fusengine.ch>

# Env configuration
ENV TERM dumb
ENV MDB_V 10.1
ENV MDB_PASS root
ENV MDB_USER root

## Add user and group to make sur their IDs get assigned consistently
RUN groupadd -r mysql && useradd -r -g mysql mysql

# IF use OSX to add data storage
RUN usermod -u 1000 mysql
