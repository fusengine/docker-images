# BitTorrent sync
#
# MAINTAINER www.fusengine.ch

FROM labengine/ubuntu-upstart
MAINTAINER Fusengine <info@fusengine.ch>
LABEL btsync = "2.2.7"

# ENV for downolad
ENV BTSYNC_VERSION 2.2.7
ENV BTSYNC_DOWNLOAD https://download-cdn.getsync.com/${BTSYNC_VERSION}/linux-x64/BitTorrent-Sync_x64.tar.gz

# Install Package
RUN apt-get update && apt-get upgrade -y

ADD ${BTSYNC_DOWNLOAD} /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/sbin btsync && rm -f /tmp/sync.tgz

# Copy config
COPY sync.conf /etc/
COPY start_sync.sh /opt/
RUN chmod 755 /opt/*.sh

# Expose port
EXPOSE 8888 55555

# volume
VOLUME ["/sync/config", "/sync/folders"]

ENTRYPOINT ["/opt/start_sync.sh"]

# Command to start_sync
CMD ["--log", "--config", "/etc/sync.conf"]
