![Alt text](https://cdn.fusengine.ch/docker/php7-apache.svg)
========================================================

# Alpine php

Contains
- php 7.0 (xdebug)
- php 7.1 (xdebug)
- php 7.2 (xdebug)
- php 7.3 (xdebug)
  
Directory and volume
--------------------

`/app/web` this is directory work. if you want a beautiful repertory list on apaxy user `volume:/app/web`

```
VOLUMES :
  /app/web
  /etc/apache2/vhost.d
  /var/log/apache2
```

Expose port 80

```
EXPOSE : 80
```

if you have any correction please suggest me Thanks for use that.

&copy; 2019 [Fusengine](http://fusengine.com)
