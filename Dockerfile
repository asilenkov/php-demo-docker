FROM composer:1 AS build-env
#COPY . /app
#RUN cd /app && composer install

FROM php:5.6.40-apache
ENV PORT 80
EXPOSE 80
#COPY --from=build-env /app /var/www/html

COPY /assets /var/www/html/assets
COPY index.php /var/www/html

RUN usermod -u 1000 www-data; \
    a2enmod rewrite; \
    chown -R www-data:www-data /var/www/html
