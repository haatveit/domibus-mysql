#!/bin/bash

mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e \
"CREATE SCHEMA ${MYSQL_DATABASE};
 ALTER DATABASE ${MYSQL_DATABASE} charset=utf8mb4 collate=utf8mb4_bin;
 CREATE USER ${MYSQL_USER} IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -u root --password="${MYSQL_ROOT_PASSWORD}" -e "grant XA_RECOVER_ADMIN on *.* to '${MYSQL_USER}'@'%';"

mysql -u root --password="${MYSQL_ROOT_PASSWORD}" "${MYSQL_DATABASE}" < "/domibus/mysql-${DOMIBUS_VERSION}.ddl"
mysql -u root --password="${MYSQL_ROOT_PASSWORD}" "${MYSQL_DATABASE}" < "/domibus/mysql-${DOMIBUS_VERSION}-data.ddl"
