#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MariaDB service startup.."
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

USER=${MARIADB_USER}
PASS=${MARIADB_PASS}

mysql -uroot -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '$USER'@'%' WITH GRANT OPTION"

echo "=> Done!"

echo "========================================================================"
echo "          You can now connect to this MariaDB Server using:             "
echo ""
echo "        mysql -user: $USER password: $PASS -h<host> -P<port>            "
echo ""
echo " Want change passeword go to env and change pass 'root' and user 'root' "
echo "========================================================================"
echo "            MariaDB user: '$USER' and password: '$PASS'"
echo "========================================================================"

mysqladmin -uroot shutdown
