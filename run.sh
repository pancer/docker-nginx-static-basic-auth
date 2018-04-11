#!/bin/sh

set -e

if [ -z $BASIC_AUTH_USERNAME ]; then
  echo >&2 "BASIC_AUTH_USERNAME must be set"
  exit 1
fi

if [ -z $BASIC_AUTH_PASSWORD ]; then
  echo >&2 "BASIC_AUTH_PASSWORD must be set"
  exit 1
fi

htpasswd -bBc /etc/nginx/.htpasswd $BASIC_AUTH_USERNAME $BASIC_AUTH_PASSWORD
sed \
  -e "s/##CLIENT_MAX_BODY_SIZE##/$CLIENT_MAX_BODY_SIZE/g" \
  -e "s/##WORKER_PROCESSES##/$WORKER_PROCESSES/g" \
  -e "s/##PORT##/$PORT/g" \
  nginx.conf.tmpl > /etc/nginx/nginx.conf

exec nginx -g "daemon off;"
