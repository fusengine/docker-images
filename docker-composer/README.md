![Alt text](http://www.fusengine.ch/img/fusengine-composer.svg)
=============================================================


### Composer

```
VOLUME : /root/.composer , /app
add your config on /root/.composer
exemple auth.json
```

Run Composer through the Composer container:
```
 $ docker run --rm -v $(pwd):/app fusengine/composer install
```

Add optional composer command to the host (tested on OS X El Capitan with docker-machine)
```
 $ docker run --rm -v $(pwd):/app -v ~/.ssh:/root/.ssh composer/composer install
```

&copy; 2016 [Fusengine](http://fusengine.com)
