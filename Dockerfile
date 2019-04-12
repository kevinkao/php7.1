FROM php:7.1-fpm-stretch

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxml2-dev \
        libmcrypt-dev \
        wget \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install gd

RUN pecl install redis \
    && pecl install mcrypt-1.0.0 \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable mcrypt

RUN mkdir /adminer; \
    wget "http://www.adminer.org/latest.php" -O /adminer/adminer.php;