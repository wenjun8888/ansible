#!/bin/bash

base () {
	groupadd nginx && useradd -r -g nginx nginx
	yum -y install gcc gcc-c++ glibc > /dev/null
	yum install -y openssl openssl-devel > /dev/null
        echo -e "\033[32mAll required packages installed...\033[0m"
	}
	
pcre() {
	cd /root/Downloads/
        tar -zxvf pcre-8.35.tar.gz > /dev/null && cd pcre-8.35
        ./configure --prefix=/usr/local/pcre > /dev/null
        make > /dev/null
        make install > /dev/null
	echo -e "\033[32mPcre installed...\033[0m"
        }

zlib () {
	cd /root/Downloads/
	tar -zxvf zlib-1.2.8.tar.gz > /dev/null && cd zlib-1.2.8
        ./configure --prefix=/usr/local/zlib > /dev/null
        make > /dev/null
        make install > /dev/null
        echo -e "\033[32mZlib installed...\033[0m"
	}

nginx () {
	cd /root/Downloads/
	tar -zxvf nginx-1.10.1.tar.gz > /dev/null && cd nginx-1.10.1
	./configure --user=nginx --group=nginx --prefix=/usr/local/nginx \
	--prefix=/usr/local/nginx \
	--pid-path=/var/run/nginx.pid \
	--lock-path=/var/run/nginx.lock \
	--with-pcre=/root/Downloads/pcre-8.35 \
	--with-zlib=/root/Downloads/zlib-1.2.8 \
	--with-http_ssl_module \
	--with-http_realip_module \
	--with-http_addition_module \
	--with-http_sub_module \
	--with-http_dav_module \
	--with-http_flv_module \
	--with-http_mp4_module \
	--with-http_gunzip_module \
	--with-http_gzip_static_module \
	--with-http_random_index_module \
	--with-http_secure_link_module \
	--with-http_stub_status_module \
	--with-http_auth_request_module \
	--with-threads \
	--with-stream \
	--with-stream_ssl_module \
	--with-http_slice_module \
	--with-mail \
	--with-mail_ssl_module \
	--with-file-aio \
	--with-http_v2_module > /dev/null
 	make > /dev/null 
	make install > /dev/null
	echo -e "\033[32mnginx installed...\033[0m"
        }
base
pcre
zlib
nginx

echo "\033[31mFinish nginx install,thank you!\033[0m"
