# Use the penultimate stable version of Debian as the base image
FROM debian:11

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Create the directory for the PHP-FPM socket file
RUN mkdir -p /run/php/

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg \
    unzip \
    php \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-xml \
    php-mbstring \
    php-zip

# Download and install WordPress
RUN wget -q https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Copy the custom PHP configuration file
COPY tools/php.ini /etc/php/7.4/fpm/php.ini

# Set permissions for WordPress
RUN chown -R www-data:www-data /var/www/html && \
    find /var/www/html/ -type d -exec chmod 755 {} \; && \
    find /var/www/html/ -type f -exec chmod 644 {} \;

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start the PHP-FPM service
CMD ["php-fpm7.4", "-F"]

