![Alt text](http://www.fusengine.ch/img/apaxy-v2.svg)
========================================================

This apache2.4.23 the ondrej repositoy.
wiht apaxy v2 : `docker pull fusengine/apaxy &  docker pull fusengine/apaxy:apaxy-v2`
without apaxy v2: `docker pull fusengine/apaxy:apache2-no-apaxy`

![Alt text](http://www.fusengine.ch/img/apaxy-v2.png)

Directory and volume
--------------------

`/app/web` this is directory work. if you want a beautiful repertory list on apaxy v2 user `volume:/app/web`

```
VOLUME :
  /app/web
  /etc/apache2/sites-enabled
  /var/log/apache2
```

Expose port 80

```
EXPOSE : 80
```

if you have any correction please suggest me Thanks for use that.

&copy; 2016 [Fusengine](http://fusengine.com)
