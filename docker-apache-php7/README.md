![Alt text](http://www.fusengine.ch/img/php7-apache.svg)
========================================================

This is to good run to php-apache2 on OSX this containt adminer to connect on database. This packages containt apache2 and php7

Blackfire
---------

You want use blackfire disable on dockerfile line `# If you want need Blackfire`:

```
# If you want need Blackfire
 RUN curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/55\
    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
    && mv /tmp/blackfire-*.so `php -r "echo ini_get('extension_dir');"`/blackfire.so \
    && echo "extension=blackfire.so\nblackfire.agent_socket=\${BLACKFIRE_PORT}" > /etc/php5/apache2/conf.d/blackfire.ini

```

Directory and volume
--------------------

`/app/web` this is directory work. if you want a beautiful repertory list on apaxy user `volume:/app/web`

```
VOLUME :
  /app/web
  /etc/apache2/sites-enabled
  /var/log/apache2
```

Expose port 80 22

```
EXPOSE : 80
```

if you have any correction please suggest me Thanks for use that.

&copy; 2015 [Fusengine](http://fusengine.com)
