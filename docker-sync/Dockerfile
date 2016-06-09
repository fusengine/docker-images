FROM labengine/ubuntu
MAINTAINER Fusengine <info@fusengine.ch>
LABEL SYNC stable

# ENV for downolad
ENV BTSYNC_VERSION stable
ENV BTSYNC_DOWNLOAD https://download-cdn.getsync.com/${BTSYNC_VERSION}/linux-x64/BitTorrent-Sync_x64.tar.gz

# Add buildpack
COPY build-sync.sh/ /root
RUN chmod 775 /root/build-sync.sh

# Run buildpack
RUN ./root/build-sync.sh

ADD ${BTSYNC_DOWNLOAD} /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/sbin btsync && rm -f /tmp/sync.tgz

# Copy config
COPY sync.conf /etc/
COPY start_sync.sh /opt/

# Fix Permission
RUN chmod 755 /opt/*.sh

# Expose port
EXPOSE 8888 55555

# volume
VOLUME ["/sync/config", "/sync/folders"]

# WORKDIR 
WORKDIR /sync

ENTRYPOINT ["/opt/start_sync.sh"]

# Command to start_sync
CMD ["--log", "--config", "/etc/sync.conf"]
