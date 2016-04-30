![Alt text](http://fusengine.ch/img/owncloud.svg)
=============================================
# Nginx php7 owncloud

#### Directory and port

```
  - WORKDIR: /var/www/owncloud
- EXPOSE port: 80
```

#### Configation to docker-composee and [Rancher](http://rancher.com)

```
owncloud:
  image: fusengine/owncloud
  ports:
   - "80:80"
  links:
    - database
  environment:

database:
  image: mariadb
  environment:
    - MYSQL_DATABASE=cloud-name
    - MYSQL_ROOT_PASSWORD=password
```
