FROM php:7.4-fpm
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

WORKDIR /usr/src/myapp
RUN composer require web-token/jwt-core
RUN composer require web-token/jwt-encryption
RUN composer require php
RUN composer require web-token/jwt-encryption-algorithm-aescbc
RUN composer require web-token/jwt-encryption-algorithm-aesgcm
RUN composer require web-token/jwt-encryption-algorithm-aeskw
RUN composer require web-token/jwt-encryption-algorithm-pbes2
RUN composer require web-token/jwt-key-mgmt
RUN composer dumpautoload
COPY . /usr/src/myapp


CMD [ "php", "./minimal.php" ]