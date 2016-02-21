Symfony3 Docker starter
===========

### Includes
    
    ELK on port 81 with nginx and symfony logs
    Redis image
    Nginx 1.9.1
    PHP 7.0.3
    A Symfony3 empty with few very useful packages
    

### Ready to start:
    
    1 - git clone https://github.com/jorge07/symfony3-docker-starter.git symfony/
    2 - Add symfony3.dev to /etc/hosts
    3 - cd /symfony && docker-compose up -d
    4 - Ready on symfony3.dev/app_dev.php and Kibana running on port 81
    
### About ssh keys

Ssh keys are shared with docker container so you must by available to run composer:
    
    docker exec symfony composer update
    
If you have a ssh secure passphrase

    docker exec -it symfony bash
    
    cd /app && composer update

### About docker image integration on PHPStorm

The leos/nginx-php7-composer:xdebug image contains ssh connection for php interpreter (leos/nginx-php7-composer:latest is production ready):
    
    SSH user: root
    SSH pass: jarcodev

Integration:

    Add remote interpreter: interpreter on /usr/local/bin/php

    Add sftp mapping to /app
    
    To finish and a phpunit for the remote interpreter:
        Autoload on /app/app/autoload.php
        Config on /app/phpunit.xml.dist
