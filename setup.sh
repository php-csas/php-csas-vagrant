#!/bin/sh

sudo apt-get update
sudo apt-get install -y git build-essential
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
wget http://php.net/get/php-5.4.45.tar.gz/from/this/mirror -O php-5.4.45.tar.gz
tar -xzvf php-5.4.45.tar.gz
cd php-5.4.45
echo "export PHPDIR=`pwd`" >> ~/.bashrc
source ~/.bashrc
./configure --enable-debug \
    --enable-maintainer-zts \
    --prefix=$PHPDIR/php-install-directory \
    --with-apxs2=/usr/bin/apxs \
make
sudo make install
echo "AddType application/x-httpd-php  .php"  | sudo tee --append /etc/apache2/apache2.conf
sudo /etc/init.d/apache2 restart

