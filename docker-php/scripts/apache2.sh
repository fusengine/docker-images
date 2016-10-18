#!/bin/bash

#source /etc/apache2/envvars
#tail -F /var/log/apache2/* &
#service apache2 restart
#exec apache2 -D FOREGROUND

source /etc/apache2/envvars
#rm /var/run/apache2/apache2.pid
tail -f /var/log/apache2/error.log &
service apache2 restart
#exec apache2 -D FOREGROUND