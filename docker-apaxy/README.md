![Alt text](http://www.fusengine.ch/img/apaxy-v2.svg)
========================================================

This apache2.4.23 the ondrej repositoy (ubuntu).

## apaxy v2
Link dev "ubuntu-apaxy": ``` docker pull fusengine/apaxy:ubuntu-apaxy``` 
link dev "alpine-apaxy": ``` docker pull fusengine/apaxy:alpine-apaxy```


## No apaxy v2
link prod "alpine-noapaxy": ``` docker pull fusengine/apaxy:alpine-noapaxy```
Link prod "ubuntu-noapaxy": ``` docker pull fusengine/apaxy:ubuntu-noapaxy```

# latest
latest (alpine): `docker pull fusengine/apaxy`

![Alt text](https://fusengine.ch/img/apaxy-v2.png)

Directory and volumes
--------------------

`/app/web` this is directory work. if you want a beautiful repertory list on apaxy v2 user `volume:/app/web`

```
VOLUME :
  /app/web
  /etc/apache2/sites-enabled => ubuntu
  /etc/apache2/vhost.d => alpine
  /var/log/apache2
```

Expose port 80

```
EXPOSE : 80
```

if you have any correction please suggest me Thanks for use that.

&copy; 2018 [Fusengine](http://fusengine.com)
