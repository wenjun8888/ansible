#!/bin/bash

user () {
 	cd /root/Downloads/
        groupadd mysql && useradd -g mysql mysql
	}
	
mysql () {
	cd /usr/local
 	tar -zxvf /root/Downloads/mysql-5.6.24-linux-glibc2.5-x86_64.tar.gz > /dev/null
        mv mysql-5.6.24-linux-glibc2.5-x86_64 mysql
        chown -R mysql.mysql /usr/local/mysql
        /usr/local/mysql/scripts/mysql_install_db \
        --user=mysql \
        --basedir=/usr/local/mysql \
        --datadir=/usr/local/mysql/data > /dev/null
        cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql
        mv /usr/local/mysql/my.cnf /etc/my.cnf
        ln -s /usr/local/mysql/bin/mysql /usr/bin        
        }

user
mysql

echo -e "\033[32mMysql installed...\033[0m"
