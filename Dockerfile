FROM php:7.4-apache

RUN cp /usr/local/etc/php/php.ini-production /etc/php/php.ini

RUN docker-php-ext-install mysqli

RUN apt-get update -y && apt-get install -y vim sendmail libpng-dev libonig-dev libzip-dev libxml2-dev zlib1g-dev

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd