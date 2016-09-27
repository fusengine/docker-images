FROM labengine/ubuntu
MAINTAINER Fusengine <info@fusengine.ch>
LABEL SYNC stable

# ENV for downolad
ENV BTSYNC_VERSION stable
ENV BTSYNC_DOWNLOAD https://download-cdn.resilio.com/${BTSYNC_VERSION}/linux-x64/resilio-sync_x64.tar.gz
https://download-cdn.resilio.com/stable/linux-glibc-x64/resilio-sync_glibc23_x64.tar.gz
ADD ${BTSYNC_DOWNLOAD} /tmp/sync.tgz
RUN tar -xzvf /tmp/sync.tgz -C / btsync && rm -f /tmp/sync.tgz

# Copy config
COPY scripts/sync.conf /etc/
COPY scripts/start_sync.sh /opt/

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