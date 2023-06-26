FROM debian:11

RUN rm -rf /home/rdas-nev/data/mariadb/ibdata1
# Install MariaDB server
RUN apt-get update && apt-get install -y mariadb-server

# Copy the MariaDB configuration files
COPY conf/* /etc/mysql/conf.d/

# Set the environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_DATABASE=${DB_NAME}

# Create directories and set permissions
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

# Expose the MySQL port
EXPOSE 3306

# Start MariaDB service
CMD ["mysqld"]

