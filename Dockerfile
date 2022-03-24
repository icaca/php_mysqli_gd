FROM php:7.4.28-apache

RUN docker-php-ext-install mysqli

RUN apt-get update -y && apt-get install -y vim sendmail libpng-dev libonig-dev libzip-dev libxml2-dev zlib1g-dev mailutils

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install exif

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

RUN a2enmod rewrite

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN sed -i 's/disable_functions =/disable_functions = exec,system,passthru,popen,proc_open,shell_exec/g' /usr/local/etc/php/php.ini