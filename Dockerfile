FROM alpine:latest

RUN apk add pgbouncer

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
