FROM leos/nginx-php7-composer:xdebug

COPY nginx/host.conf /etc/nginx/conf.d/app.conf

RUN usermod -u 1000 www-data
RUN mkdir -p /app/var/log/nginx
WORKDIR /app