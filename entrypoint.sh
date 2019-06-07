#!/bin/sh

adduser postgres
mkdir -p /var/log/pgbouncer
chmod -R 755 /var/log/pgbouncer
chown -R postgres:postgres /var/log/pgbouncer

echo "Starting pgbouncer..."
exec /usr/bin/pgbouncer -q -u postgres /etc/pgbouncer/pgbouncer.ini

