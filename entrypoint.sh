#!/bin/bash

# Provide a default message if WELCOME_MSG is not set
export WELCOME_MSG="${WELCOME_MSG:-Welcome to NGINX on ROSA!}"

# Inject environment variable into index.html
envsubst < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html

# Start NGINX
nginx -g "daemon off;"
