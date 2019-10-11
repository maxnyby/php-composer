FROM php:7.2

RUN apt-get update && \
	apt-get install git curl zlib1g-dev lftp -yqq && \
  rm -rf /var/lib/apt/lists/* && \
	docker-php-ext-install zip && \
	curl --silent --show-error https://getcomposer.org/installer | php && \
	mv composer.phar /bin/composer && \
	docker-php-source delete

RUN	composer global require "hirak/prestissimo" "jakub-onderka/php-parallel-lint" "jakub-onderka/php-console-highlighter"
