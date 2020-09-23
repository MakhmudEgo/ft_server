#!/bin/bash
if [[ "$1" == "on" || "$1" == "off" ]]; then
sed -i -e "s/autoindex [a-z]*/autoindex $1/" /etc/nginx/sites-available/nginx.conf
nginx -s reload
else
echo "No valid arg, write 'on' or 'off'"
fi