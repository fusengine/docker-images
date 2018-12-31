![Alt text](https://cdn.fusengine.ch/docker/fusengine-composer.svg)
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

Add optional composer command to the host (tested on OS X "El Capitan, Sierra"  with docker-machine)
```
 $ docker run --rm -v $(pwd):/app -v ~/.ssh:/root/.ssh fusengine/composer install
```

### Symfony use
```

Use symfony => symfony new blog
Use composer => composer.

```

### Laravel use

```
for exemple: composer create-project --prefer-dist laravel/laravel myproject
```

&copy; 2019 [Fusengine](http://fusengine.com)
