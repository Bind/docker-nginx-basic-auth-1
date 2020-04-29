#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
envsubst '${FORWARD_HOST},${FORWARD_PORT}' < auth.conf > /etc/nginx/conf.d/auth.conf
envsubst '${FORWARD_HOST},${FORWARD_PORT}' < 00-websockets.conf > /etc/nginx/conf.d/00-websockets.conf
envsubst < auth.htpasswd > /etc/nginx/auth.htpasswd

nginx -g "daemon off;"
