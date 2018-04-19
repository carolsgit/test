#!/bin/bash
#centos6.5
#2.6.32-431.el6.x86_64
#auto install httpd to /usr/local/apache2
#by sunny 2015
 
yum install -y \
zlib-devel \
openssl-devel \
apr-devel \
apr-util-devel \
openssl-devel \
libevent-devel \
pcre-devel 

#path
prefix=/usr/local/apache2
file=httpd-2.2.34.tar.gz
filedir=httpd-2.2.34
hurl=http://mirrors.tuna.tsinghua.edu.cn/apache//httpd/
 
#download apache
cd /usr/local/src/
wget -c $hurl$file
if [ $? -eq 0 ];then
    tar -zxvf $file &&cd $filedir
fi
 
#configure ; install
if [ "$PWD" = "/usr/local/src/$filedir" ];then
./configure \
--prefix=$prefix \
--enable-deflate \
--enable-expires \
--enable-headers \
--enable-ssl \
--enable-rewrite \
--enable-modules=most \
--enable-so
 
    if [ $? -eq 0 ];then
        make &&make install
        echo -e "\033[32m apache install successful...\033[0m"
        echo -e "\033[32m apache install dir:$prefix \033[0m"
 
    else
        echo -e "\033[32m error,please check the configure..\033[0m"
    fi
else
echo -e "\033[32m error,please check..\033[0m"
fi
