#!/bin/bash
source ../../../.env
# Wait for the database to be ready
until mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    echo "Waiting for database server to be available..."
    sleep 1
done
echo "Database server is now available."
# Create the WordPress database
echo "Creating WordPress database..."
mysql -h"$WORDPRESS_DB_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;
EOF
echo "WordPress database created."
# Grant privileges to the user
echo "Granting privileges to the user..."
mysql -h"$WORDPRESS_DB_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" <<EOF
GRANT ALL ON $WORDPRESS_DB_NAME.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF
echo "Privileges granted."
echo "Database setup complete."

