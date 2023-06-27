# Use Debian 11 as the base image
FROM debian:11

# Install Nginx and other dependencies
RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y vim
# Copy custom Nginx configuration file
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./tools/nginx.crt /etc/nginx/nginx.crt
COPY ./tools/nginx.key /etc/nginx/nginx.key
# Expose ports
EXPOSE 80
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

