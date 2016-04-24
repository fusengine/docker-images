#!/bin/bash

#rsync -aq wpc/* wp-content
  /var/www/html/wordpress/wp-content

grep -q "if (\$_SERVER\['HTTP_X_FORWARDED_PROTO'] == 'https') \$_SERVER\['HTTPS']='on';" wp-config.php || sed --in-place "/require_once(ABSPATH . 'wp-settings.php');/i if (\$_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') \$_SERVER['HTTPS']='on';\n" wp-config.php

service php5-fpm start
nginx
