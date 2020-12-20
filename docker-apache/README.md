![Alt text](https://cdn.fusengine.ch/docker/php.svg)
========================================================

# Alpine php

| PHP     | xdebug | apaxy | no Apaxy |
| ------- | :----: | ----: | -------: |
| php 7.2 |   ✔    |     ✔ |        ✔ |
| php 7.3 |   ✔    |     ✔ |        ✔ |
| php 7.4 |   ✔    |     ✔ |        ✔ |
| php 8.0 |   ✔    |     ✔ |        ✔ |

<br>

Directory and volume
--------------------

| ENV Default          |         Are          |
| -------------------- | :------------------: |
| /app/web             |    Host web file     |
| /etc/apache2/vhost.d |  Virtual host file   |
| /var/log/apache2     |       Log file       |
| port 80              | default port apache2 |


<br/>
If you use PHP 8 JIT Config 
----------------

| Env                |  Default   |
| ------------------ | :--------: |
| ZEND_EXTENSION     | opcache.so |
| OPCACHE_ENABLE     |     1      |
| OPCACHE_ENABLE_CLI |     1      |
| JIT_BUFFER_SIZE    |    50MB    |
| JIT                |  tracing   |

<br>

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
