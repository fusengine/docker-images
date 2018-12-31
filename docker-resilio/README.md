![Alt text](https://cdn.fusengine.ch/docker/resilio.svg)
=================================================

### Resilio Sync server ports

EXPOSE `55555` `8888`

#### Add volumes

```
VOLUME :
    /sync/
    /sync/config
    /sync/folders
    /sync/downloads
```

&copy; 2019 [Fusengine](http://fusengine.com)
