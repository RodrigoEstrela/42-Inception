FROM debian:11

RUN apt-get update && apt-get install -y \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

COPY tools/mariadb-entrypoint.sh /usr/bin/mariadb-entrypoint.sh
COPY tools/installation-script /usr/bin/installation-script

RUN chmod +x /usr/bin/installation-script
RUN chmod +x /usr/bin/mariadb-entrypoint.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/wordpress.sql /opt/wordpress.sql

EXPOSE 3306

ENTRYPOINT [ "/usr/bin/mariadb-entrypoint.sh" ]

CMD ["mysqld"]
