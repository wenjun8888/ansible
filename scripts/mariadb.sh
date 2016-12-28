#!/bin/bash

user () {
 	cd /root/Downloads/
        groupadd mysql && useradd -g mysql mysql
	}
	
mysql () {
	cd /usr/local
 	tar -zxvf /root/Downloads/mariadb-10.0.23-linux-x86_64.tar.gz > /dev/null
        mv mariadb-10.0.23-linux-x86_64 mysql
        chown -R mysql.mysql /usr/local/mysql
        /usr/local/mysql/scripts/mysql_install_db \
        --user=mysql \
        --basedir=/usr/local/mysql \
        --datadir=/usr/local/mysql/data > /dev/null
        cp /usr/local/mysql/support-files/my-small.cnf /etc/my.cnf
        ln -s /usr/local/mysql/bin/mysql /usr/bin        
        }

user
mysql

echo -e "\033[32mMysql installed...\033[0m"
