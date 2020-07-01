FROM php:7.4-apache

RUN docker-php-ext-install mysqli

RUN apt-get update -y && apt-get install -y vim sendmail libpng-dev libonig-dev libzip-dev libxml2-dev zlib1g-dev mailutils

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN a2enmod rewrite

RUN mv /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini