#http://qiita.com/hnakamur/items/0b72590136cece29faee
FROM typista/nginx-lua
# install php
RUN yum update -y && \
	yum install -y wget php-cgi php-mysql && \
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    rpm -Uvh epel-release-6*.rpm && \
    yum install --enablerepo=epel -y spawn-fcgi && \
    cd /etc/init.d/ && \
    wget http://sakuratan.biz/nginx/php-fastcgi && \
    chmod +x php-fastcgi && \
    mkdir -p /var/run/nginx/ && \
	wget https://raw.githubusercontent.com/typista/docker-nginx-php-libmysql/master/files/etc_init.d_nginx -O /etc/init.d/nginx && \
	wget https://raw.githubusercontent.com/typista/docker-nginx-php-libmysql/master/files/nginx.conf -O /usr/local/nginx/conf/nginx.conf && \
	wget https://raw.githubusercontent.com/typista/docker-nginx-php-libmysql/master/files/php_exec -O /usr/local/nginx/conf/php_exec && \
	wget https://raw.githubusercontent.com/typista/docker-nginx-php-libmysql/master/files/php_ssl_exec -O /usr/local/nginx/conf/php_ssl_exec && \
	wget https://raw.githubusercontent.com/typista/docker-nginx-php-libmysql/master/files/services.sh -O /etc/services.sh && \
	chmod +x /etc/services.sh && \
	chmod +x /etc/init.d/nginx
#EXPOSE 80
#ENTRYPOINT /etc/services.sh

