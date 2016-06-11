Symfony3 Docker starter
===========
[![Code Climate](https://codeclimate.com/github/jorge07/symfony3-docker-starter/badges/gpa.svg)](https://codeclimate.com/github/jorge07/symfony3-docker-starter) [![Build Status](https://travis-ci.org/jorge07/symfony3-docker-starter.svg?branch=master)](https://travis-ci.org/jorge07/symfony3-docker-starter)

### Includes
    
- ELK on port 81 with nginx and symfony logs
- Redis image
- Nginx 1.9.1
- PHP 7.0.7
- A Symfony3 empty with few very useful packages
    
### About ssh keys

Ssh keys are shared with docker container so you must by available to run composer:
    
    docker exec -it symfony_php composer install

### Ready to start:
    
1 - git clone https://github.com/jorge07/symfony3-docker-starter.git symfony/
2 - Add symfony.dev to /etc/hosts
3 - cd /symfony && docker-compose up -d
4 - run composer (Explanation above)
5 - Ready on symfony.dev/app_dev.php and Kibana running on port 81
    

### About docker image integration on PHPStorm

SSH settings    
  - user: root
  - pass: jarco

Integration:

    Add remote interpreter: binary on /usr/local/bin/php

    Add sftp mapping to /app
    
    To finish add a phpunit for the remote interpreter:
        Autoload on /app/app/autoload.php
        Config on /app/phpunit.xml.dist
