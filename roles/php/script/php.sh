#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin

yum -y install libXpm-devel libxml2-devel libjpeg-turbo-devel libpng-devel freetype-devel bzip2 bzip2-devel libcurl-devel t1lib-devel libmcrypt-devel openssl-devel libxslt-devel re2c libtool-ltdl-devel

# create link
[ ! -f /usr/lib/libmysqlclient.so ] && ln -s /usr/lib64/mysql/libmysqlclient.so /usr/lib/
[ ! -f /usr/lib/libXpm.so ] && ln -s /usr/lib64/libXpm.so /usr/lib/
# install php
cd /usr/local/src
tar zxf php-5.3.29.tar.gz
cd php-5.3.29
./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --enable-bcmath --enable-sockets --enable-shmop --enable-zip --enable-soap --enable-pcntl --enable-mbstring --with-gd --with-zlib-dir --with-jpeg-dir --with-png-dir --enable-gd-native-ttf --with-freetype-dir --with-xpm-dir --with-bz2 --with-xmlrpc --with-xsl --with-zlib --with-mhash --with-mcrypt --with-mysql --with-curl --with-t1lib --with-gettext --with-openssl
make && make install
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm && chmod 755 /etc/init.d/php-fpm && chkconfig --add php-fpm

#cd ../ && rm -fr php-5.3.29

mkdir /var/log/php-fpm
ln -s /usr/local/php/bin/php* /usr/bin/