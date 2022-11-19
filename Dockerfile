FROM php:7.4-fpm

WORKDIR /app

RUN apt-get update && \
    apt-get install -y
RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y libonig-dev
RUN docker-php-ext-install intl 
RUN docker-php-ext-configure intl

RUN docker-php-ext-install mysqli pdo pdo_mysql zip mbstring

RUN docker-php-ext-configure gd \
    && docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer |php -- \
     --install-dir=/usr/local/bin --filename=composer

RUN chmod +x /usr/local/bin/composer

ARG COMPOSER_ALLOW_SUPERUSER=1

COPY ./vira_dockerized_app/ .

RUN composer update
RUN composer install

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "production" ]; \
    then rm /app/vira_dockerized_app/.env && mv /app/vira_dockerized_app/.env.prod /app/vira_dockerized_app/.env; \
    fi

CMD [ "composer", "start" ]
