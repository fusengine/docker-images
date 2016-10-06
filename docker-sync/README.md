
# DEPRECATED go => [fusengine/resilio](https://hub.docker.com/r/fusengine/resilio/)


![Alt text](http://www.fusengine.ch/img/sync.svg)
=================================================

### Sync server ports

EXPOSE `55555` `8888`

#### Download latest version to Sync

```
Exemple :
  Dockerfile:
    ENV BTSYNC_DOWNLOAD https://download-cdn.getsync.com/..._x64.tar.gz
    ${BTSYNC_DOWNLOAD}
```

#### Add volumes

```
VOLUME :
    /sync/config
    /sync/folders
```

&copy; 2016 [Fusengine](http://fusengine.com)
