#!/bin/sh

mkdir -p /var/log/pgbouncer
chmod -R 755 /var/log/pgbouncer
chown -R postgres:postgres /var/log/pgbouncer

POSTGRES_DB=${POSTGRES_DB:-postgres}
POSTGRES_USER=${POSTGRES_USER:-postgres}
POSTGRES_HOST=${POSTGRES_HOST:-postgres}
POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-postgres}
POSTGRES_PORT=${POSTGRES_PORT:-5432}

cp /etc/pgbouncer/userlist.txt.tmpl /etc/pgbouncer/userlist.txt
sed -i "s/<POSTGRES_USER>/$POSTGRES_USER/g" /etc/pgbouncer/userlist.txt
sed -i "s/<POSTGRES_PASSWORD>/$POSTGRES_PASSWORD/g" /etc/pgbouncer/userlist.txt

cp /etc/pgbouncer/pgbouncer.ini.tmpl /etc/pgbouncer/pgbouncer.ini
sed -i "s/<POSTGRES_DB>/$POSTGRES_DB/g" /etc/pgbouncer/pgbouncer.ini
sed -i "s/<POSTGRES_USER>/$POSTGRES_USER/g" /etc/pgbouncer/pgbouncer.ini
sed -i "s/<POSTGRES_HOST>/$POSTGRES_HOST/g" /etc/pgbouncer/pgbouncer.ini
sed -i "s/<POSTGRES_PASSWORD>/$POSTGRES_PASSWORD/g" /etc/pgbouncer/pgbouncer.ini
sed -i "s/<POSTGRES_PORT>/$POSTGRES_PORT/g" /etc/pgbouncer/pgbouncer.ini

echo "Starting pgbouncer..."
exec /usr/bin/pgbouncer -q -u postgres /etc/pgbouncer/pgbouncer.ini

