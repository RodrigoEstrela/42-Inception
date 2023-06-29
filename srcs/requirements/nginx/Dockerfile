# Use Debian 11 as the base image
FROM debian:11

# Install Nginx and other dependencies
RUN apt-get update && apt-get install -y nginx openssl vim \
	&& rm -rf /var/lib/apt/lists/*
#Expose ports
EXPOSE 443
# Copy custom Nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/conf.d
COPY ./tools/nginx.crt /etc/nginx/nginx.crt
COPY ./tools/nginx.key /etc/nginx/nginx.key

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN rm /etc/nginx/sites-enabled/default && \
	rm /etc/nginx/sites-available/default
# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

