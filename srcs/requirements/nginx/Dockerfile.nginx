FROM debian:10.11

RUN apt-get update -yq

RUN apt-get install nano -yq
RUN apt-get install nginx -yq
RUN apt-get install openssl -yq
RUN apt-get install gettext-base -yq
RUN ln -sf /usr/share/zoneinfo/Europe/Lisbon /etc/localtime
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -new -x509 -days 365 -nodes \
-out /etc/nginx/ssl/rdas-nev.pem \
-keyout /etc/nginx/ssl/rdas-nev.key \
-subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/OU=42Lisboa-/CN=rdas-nev.42.fr/"
RUN chmod 600 /etc/nginx/ssl/rdas-nev*

# Copy NGINX configuration files
COPY /tools/ /tmp/
COPY /conf/nginxconf /nginxconf

ENTRYPOINT ["sh", "-c", "/bin/bash /tmp/run.sh"]
