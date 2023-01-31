FROM php:7.4-fpm

RUN apt-get update && apt-get install -y libcurl4-openssl-dev
RUN docker-php-ext-install curl
RUN docker-php-ext-enable curl

RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install dom
RUN docker-php-ext-enable dom

RUN apt-get install -y libmagic-dev
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-enable fileinfo

RUN apt-get install -y libfreetype6-dev libjpeg-dev libwebp-dev libpng-dev libxpm-dev
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm
RUN docker-php-ext-install gd
RUN docker-php-ext-enable gd

RUN docker-php-ext-install json
RUN docker-php-ext-enable json

RUN apt-get install -y libonig-dev
RUN docker-php-ext-install mbstring
RUN docker-php-ext-enable mbstring

#RUN apt-get install -y libssl-dev
#RUN docker-php-ext-install openssl
#RUN docker-php-ext-enable openssl

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

RUN docker-php-ext-install tokenizer
RUN docker-php-ext-enable tokenizer

RUN apt-get install -y libzip-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-enable zip

CMD ["php-fpm"]
