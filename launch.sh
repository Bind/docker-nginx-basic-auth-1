#!/bin/sh

rm /etc/nginx/conf.d/default.conf || :
envsubst < nginx.conf > /etc/nginx/conf.d/nginx.conf
envsubst < auth.conf > /etc/nginx/conf.d/auth.conf
envsubst < auth.htpasswd > /etc/nginx/auth.htpasswd

nginx -g "daemon off;"
