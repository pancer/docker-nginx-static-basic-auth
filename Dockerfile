FROM nginx:mainline-alpine

LABEL LABEL maintainer="Pance Ribarski"

VOLUME /var/www/html

RUN apk add --no-cache --update \
    apache2-utils \
    && rm -f /etc/nginx/conf.d/*

ENV PORT 80
ENV CLIENT_MAX_BODY_SIZE 1m
ENV WORKER_PROCESSES auto

COPY run.sh /
COPY nginx.conf.tmpl /

STOPSIGNAL SIGQUIT

ENTRYPOINT ["/run.sh"]

