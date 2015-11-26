![Alt text](http://www.fusengine.ch/img/sync.png)
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

&copy; 2015 [Fusengine](http://fusengine.com)