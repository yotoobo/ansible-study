#!/bin/bash

VERSION=$1

cd /usr/local/src
tar xzf redis-$VERSION.tar.gz
cd redis-$VERSION
make
make install PREFIX=/usr/local

cd ../ && rm -fr redis-$VERSION