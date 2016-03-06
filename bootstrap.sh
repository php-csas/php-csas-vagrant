#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y git build-essential wget
sudo apt-get remove -y php5
sudo apt-get install -y apache2 apache2-dev
sudo apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libpng-dev \
    libxpm-dev \
    libmysqlclient-dev \
    libpq-dev \
    libicu-dev \
    libfreetype6-dev \
    libldap2-dev \
    libxslt-dev
/usr/bin/wget -nv http://php.net/get/php-5.4.45.tar.gz/from/this/mirror -O php-5.4.45.tar.gz
tar -xzvf php-5.4.45.tar.gz
cd php-5.4.45
export PHPDIR=`pwd`
/bin/echo "export PHPDIR=`pwd`"  | sudo /usr/bin/tee --append /home/vagrant/.bashrc
/bin/echo 'export PATH=$PATH:$PHPDIR/php-install-directory/bin/'  | sudo /usr/bin/tee --append /home/vagrant/.bashrc
/bin/echo "alias build-php='cd $PHPDIR;$PHPDIR/configure --enable-debug --enable-maintainer-zts --prefix=$PHPDIR/php-install-directory --with-apxs2=/usr/bin/apxs'"  | sudo /usr/bin/tee --append /home/vagrant/.bashrc
$PHPDIR/configure --enable-debug \
    --enable-maintainer-zts \
    --prefix=$PHPDIR/php-install-directory \
    --with-apxs2=/usr/bin/apxs
/usr/bin/make
sudo /usr/bin/make install
/bin/echo "AddType application/x-httpd-php  .php"  | sudo /usr/bin/tee --append /etc/apache2/apache2.conf
export PATH=$PATH:$PHPDIR'/php-install-directory/bin/'
sudo /etc/init.d/apache2 restart
sudo /usr/bin/touch /var/www/html/info.php
/bin/echo "<?php phpinfo(); ?>"  | sudo /usr/bin/tee --append /var/www/html/info.php

git clone https://github.com/php-csas/php-csas.git ~/php-csas
git clone https://github.com/php-csas/test-sites.git ~/test-sites
git clone https://github.com/php-csas/php-csas-docs.git ~/php-csas-docs
git clone https://github.com/php-csas/taint.git ~/taint
git clone https://github.com/php-csas/ctemplate.git ~/ctemplate
git clone https://github.com/php-csas/php-travis-ci-tests-example.git ~/php-travis-ci-tests-example
https://github.com/php-csas/closure-templates.git ~/closure-templates
