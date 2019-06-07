FROM alpine:latest

RUN apk add pgbouncer

COPY entrypoint.sh /
COPY pgbouncer.ini.tmpl /etc/pgbouncer/pgbouncer.ini.tmpl
COPY userlist.txt.tmpl /etc/pgbouncer/userlist.txt.tmpl
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
