FROM php:7.0-fpm

### Install Others
RUN apt-get update && apt-get install -y git zlib1g-dev libmcrypt-dev supervisor openssh-server \
    && mkdir -p /var/log/supervisor \
    && mkdir -p /var/run/sshd \
    && rm -rf /var/lib/apt/lists/*


RUN docker-php-ext-install bcmath mbstring opcache pcntl zip mcrypt pdo_mysql \
    ## APCu
   && pecl install apcu \
   && docker-php-ext-enable apcu \
   ## Xdebug
   && pecl install xdebug-beta \
   && docker-php-ext-enable xdebug

#Add composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY supervisor/supervisor.conf /etc/supervisor/conf.d/supervisord.conf

COPY ssh/credentials.sh /root/
RUN chmod 755 /root/credentials.sh

COPY php.ini /usr/local/etc/php/php.ini
COPY php-fpm.conf /usr/local/etc/php-fpm.conf

RUN useradd -ms /bin/bash jarco
RUN usermod -u 1000 jarco

# SSH config
RUN echo 'root:jarcodev' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "export VISIBLE=now" >> /etc/profile


CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

WORKDIR /app
