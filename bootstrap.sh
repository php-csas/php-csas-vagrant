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
/usr/bib/wget -nv http://php.net/get/php-5.4.45.tar.gz/from/this/mirror -O php-5.4.45.tar.gz
tar -xzvf php-5.4.45.tar.gz
cd php-5.4.45
/bin/echo "export PHPDIR=`pwd`" >> ~/.bashrc
source ~/.bashrc
$PHPDIR/configure --enable-debug \
    --enable-maintainer-zts \
    --prefix=$PHPDIR/php-install-directory \
    --with-apxs2=/usr/bin/apxs \
/usr/bin/make
sudo /usr/bin/make install
/bin/echo "AddType application/x-httpd-php  .php"  | sudo /usr/bin/tee --append /etc/apache2/apache2.conf
sudo /etc/init.d/apache2 restart
