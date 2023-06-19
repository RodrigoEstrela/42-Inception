mkdir -p /usr/share/nginx/logs

CONFIG='/etc/nginx/conf.d/nginx.conf'

if [-e $CONFIG]; then
	echo "nginx config already exists"
else
	cat /default.conf.tmpl | envsubst '$DOMAIN_NAME $WP_PORT' > $CONFIG
fi

nginx -g "daemon off;"
