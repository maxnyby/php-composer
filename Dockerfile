FROM php:5.5
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apt-get update && \
    apt-get install git curl zlib1g-dev -yqq && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install zip && \
    curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /bin/composer

RUN	composer global require "hirak/prestissimo"
