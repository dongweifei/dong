#!/bin/bash


cd /root/lnmp_soft/
#安装nginx依赖包
yum -y install gcc make pcre-devel openssl-devel zlib-devel mariadb mariadb-server mariadb-devel php php-pecl-memcache php-mysql php-fpm >/dev/null
#启动服务
systemctl restart php-fpm mariadb
systemctl enable php-fpm mariadb
#切换到目录安装源码包
cd /root/lnmp_soft/nginx-1.12.2/
#指定功能
./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module >/dev/null 
#编译并安装
make && make install
#创建用户
useradd -s /sbin/nologin nginx
cd
#设置软连接
ln -s /usr/local/nginx/sbin/nginx /sbin/


