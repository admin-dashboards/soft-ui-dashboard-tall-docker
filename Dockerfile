# Use an official PHP runtime as a parent image
FROM php:8.1-fpm

# Install Composer 2.0
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.0.14

# Install nginx
RUN apt-get update && apt-get install -y libsqlite3-dev nano git zip unzip nginx openssl libssl-dev pkg-config

# Install sqlite driver for PHP

RUN docker-php-ext-install pdo_sqlite

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Copy nginx configuration file to the container
COPY ./docker/nginx/default /etc/nginx/sites-available/default

COPY . /usr/src/app/

WORKDIR /usr/src/app/

# Set permissions for storage and bootstrap directories
RUN chmod -R 777 storage bootstrap/cache

# WORKDIR /usr/src/app/

# Expose port 80 for Nginx
EXPOSE 80

CMD service nginx start && php-fpm