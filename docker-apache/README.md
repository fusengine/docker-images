![Alt text](http://www.fusengine.ch/img/php7-apache.svg)
========================================================

# Ubuntu php

#### php dev
link dev with apaxy v2  xdebug phpunit"php5.6": ``` docker pull fusengine/apache-php:ubuntu_php5.6_env-dev```
link dev with apaxy-v2 xdebug phpunit "php7.0": ``` docker pull fusengine/apache-php:ubuntu_php7.0_env-dev```
link dev with apaxy-v2 xdebug phpunit "php7.1": ``` docker pull fusengine/apache-php:ubuntu_php7.1_env-dev```

#### php production
Link prod "php5.6": ``` docker pull fusengine/apache-php:ubuntu_php5.6-prod``` 
Link prod "php7.0": ``` docker pull fusengine/apache-php:ubuntu_php7.0-prod``` 
link prod "php7.1": ``` docker pull fusengine/apache-php:ubuntu_php7.1-prod```

# Alpine php

#### php dev
link dev with apaxy v2  xdebug phpunit"php5.6": ``` docker pull fusengine/apache-php:alpine_php5.6_env-dev```
link dev with apaxy-v2 xdebug phpunit "php7.0": ``` docker pull fusengine/apache-php:alpine_php7.0_env-dev```
link dev with apaxy-v2 xdebug phpunit "php7.1": ``` docker pull fusengine/apache-php:alpine_php7.1_env-dev```
link dev with apaxy-v2 xdebug phpunit "php7.1": ``` docker pull fusengine/apache-php:alpine_php7.2_env-dev```

#### php production
Link prod "php5.6": ``` docker pull fusengine/apache-php:alpine_php5.6-prod``` 
Link prod "php7.0": ``` docker pull fusengine/apache-php:alpine_php7.0-prod``` 
link prod "php7.1": ``` docker pull fusengine/apache-php:alpine_php7.1-prod```

#### latest is the version apaxy php7.1

This is to good run to php-apache2 on OSX this containt adminer to connect on database. This packages containt apache2 and php7.1 

Blackfire
---------

You want use blackfire. Uncomment line `# If you want need Blackfire` on dockerfile:

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
  alpine => /etc/apache2/vhost.d
  /var/log/apache2
```

Expose port 80 

```
EXPOSE : 80
```

if you have any correction please suggest me Thanks for use that.

&copy; 2017[Fusengine](http://fusengine.com)
