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

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN composer require web-token/jwt-core web-token/jwt-encryption php web-token/jwt-encryption-algorithm-aescbc web-token/jwt-encryption-algorithm-aesgcm web-token/jwt-encryption-algorithm-aeskw web-token/jwt-encryption-algorithm-pbes2 web-token/jwt-key-mgmt
RUN composer dumpautoload


CMD [ "php", "./minimal.php" ]