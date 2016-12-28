#!/bin/bash

sleep 20
/usr/bin/mysql  -e "update mysql.user set password = PASSWORD('Aa111111') where user = 'root';"
/usr/bin/mysql  -e "flush privileges;"
/usr/bin/echo  "127.0.0.1   "`hostname` >> /etc/hosts
