#!/bin/bash
#auto install nginx
#by sunny
 
#add user
groupadd nginx
useradd nginx -M -s /sbin/nologin -g nginx
 
 
yum install pcre-devel gcc gcc-c++ zlib-devel openssl-devel -y
 
#download
wget http://nginx.org/download/nginx-1.12.2.tar.gz
tar xvf nginx-1.12.2.tar.gz -C /usr/local/src/
cd /usr/local/src/nginx-1.12.2
 
#install nginx
mkdir /apps
 
sleep 2
 
/usr/local/src/nginx-1.12.2/configure \
--prefix=/apps/nginx-1.12.2 \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-pcre
 
make &&make install
