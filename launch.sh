#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
envsubst < auth.conf > /etc/nginx/conf.d/auth.conf
envsubst < 00-websockets.conf > /etc/nginx/conf.d/00-websockets.conf
envsubst < auth.htpasswd > /etc/nginx/auth.htpasswd

nginx -g "daemon off;"
