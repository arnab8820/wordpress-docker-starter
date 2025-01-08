FROM wordpress:6.7.1-php8.1-fpm-alpine
COPY php/custom.ini $PHP_INI_DIR/conf.d/