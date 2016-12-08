#!/bin/bash

jdk () {
 	cd /root/Downloads/
	mkdir /usr/local/java
	tar -zxvf jdk-7u60-linux-x64.tar.gz -C /usr/local/java/ > /dev/null
        echo -e "\033[32mJDK installed...\033[0m"
	}
	
tomcat () {
	cd /root/Downloads/
        tar -zxvf apache-tomcat-8.0.33.tar.gz -C /usr/local/ > /dev/null
        mv /usr/local/apache-tomcat-8.0.33 /usr/local/tomcat
	echo -e "\033[32mTomcat installed...\033[0m"
        }

copy_env () {
	cat /opt/tomcat.env >> /etc/profile
        echo -e "\033[32mJava Env OK...\033[0m"
	}


jdk
tomcat
copy_env

echo "\033[31mFinish nginx tomcat,thank you!\033[0m"
