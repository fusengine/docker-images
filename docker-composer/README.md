![Alt text](http://fusengine.ch/img/composer.svg)
=================================================

Composer Docker Container
=========================

[Docker](http://docker.com) container to install and run [Composer](http://getcomposer.org).

Features
--------

-	[Composer](http://getcomposer.org)
	-	Latest snapshot: `master`
	-	[`1.0.0-alpha11`](https://github.com/composer/composer/blob/1.0.0-alpha11/CHANGELOG.md)
	-	[`1.0.0-alpha10`](https://github.com/composer/composer/blob/1.0.0-alpha10/CHANGELOG.md)
	-	[`1.0.0-alpha9`](https://github.com/composer/composer/blob/1.0.0-alpha9/CHANGELOG.md)
	-	[`1.0.0-alpha8`](https://github.com/composer/composer/blob/1.0.0-alpha8/CHANGELOG.md)
-	[PHP](http://php.net) [5.6](http://php.net/ChangeLog-5.php)

Installation / Usage
--------------------

1.	Install the `fusengine/composer` container:

	```sh
	$ docker pull fusengine/composer
	```

Alternatively, pull a specific version of `fusengine/composer`: `sh
    $ docker pull fusengine/composer:1.0.0-alpha11
`

1.	Create a composer.json defining your dependencies. Note that this example is a short version for applications that are not meant to be published as packages themselves. To create libraries/packages please read the[documentation](http://getcomposer.org/doc/02-libraries.md).

	```json
	{
	    "require": {
	        "monolog/monolog": ">=1.0.0"
	    }
	}
	```

2.	Run Composer through the Composer container:

	```sh
	$ docker run -v $(pwd):/app fusengine/composer install
	```

	Or run using a specific version of Composer:`sh
	$ docker run -v $(pwd):/app fusengine/composer:1.0.0-alpha11 install
	`

Installation from Source
------------------------

To run, test and develop the Composer Dockerfile itself, you must use the source directly:

1.	Switch to the `composer-docker` directory:

	```sh
	$ cd composer-docker
	```

2.	Build the container, using Composer's latest `master` release:

	```sh
	$ docker build -t fusengine/composer master
	```

3.	Test running Composer through the container:

	```sh
	$ docker run fusengine/composer help
	```

&copy; 2015 [Fusengine](http://fusengine.com)
