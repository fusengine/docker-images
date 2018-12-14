![Alt text](http://fusengine.ch/img/mariadb.svg)
================================================

Base docker image to run a MariaDB database server is good to mount volumes on OSX :)

Usage
-----

To run the image and bind to port 3306:

```
    docker run -d -p 3306:3306 fusengine/mariadb
```

This user and password is preset to ENV

```
ENV:
  MARIADB_PASS root
  MARIADB_USER root
```

```
    docker logs <CONTAINER_ID>
```

You will see an output like the following:

```
========================================================================
        You can now connect to this MariaDB Server using:

        mysql -user: root password: root -h<host> -P<port>

Want change passeword go to env and change pass 'root' and user 'root'
            MariaDB user: 'root' and password: 'root'
========================================================================
```

Setting a specific password and specific user
---------------------------------------------

If you want to use a preset password instead of a random generated one, you can set the environment variable `MARIADB_PASS` to your specific password when running the container:

```
    docker run -d -p 3306:3306 -e MARIADB_PASS="mypass" MARIADB_USER="mypass" fusengine/mariadb
```

Mounting the database file volume from other containers
-------------------------------------------------------

One way to persist the database data is to store database files in another container. To do so, first create a container that holds database files:

```
docker run -d -v /var/lib/mysql --name db_vol -p 22:22 labengine/ubuntu-upstart
```

This will create a new ssh-enabled container and use its folder `/var/lib/mysql` to store MariaDB database files. You can specify any name of the container by using `--name` option, which will be used in next step.

After this you can start your MariaDB image using volumes in the container created above (put the name of container in `--volumes-from`\)

```
docker run -d --volumes-from db_vol -p 3306:3306 fusengine/mariadb
```

&copy; 2019 [Fusengine](http://fusengine.com)
