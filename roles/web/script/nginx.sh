#!/bin/bash

# install packages
yum -y -q install pcre-devel openssl-devel zlib-devel make gcc gcc-c++

# useradd nginx
useradd -s /sbin/nologin -M nginx

# install nginx
cd /usr/local/src
tar zxf nginx-1.12.0.tar.gz && cd nginx-1.12.0
./configure --prefix=/usr/local/nginx --pid-path=/var/run/nginx.pid --lock-path=/var/lock/subsys/nginx --user=nginx --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module 
make && make install
mkdir /usr/local/nginx/conf/conf.d/
cd ../ && rm -fr nginx-1.12.0

# create dir
[ ! -d /var/log/nginx ] && mkdir /var/log/nginx && chown nginx /var/log/nginx
