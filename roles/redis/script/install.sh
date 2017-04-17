#!/bin/bash

VERSION=$1

cd /usr/local/src/
tar xvf redis-$VERSION.tar.gz
cd redis-$VERSION
make -j2
make install PREFIX=/usr/local

cd ../ && rm -fr redis-$VERSION

mkdir /etc/redis
