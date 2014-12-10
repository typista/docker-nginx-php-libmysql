#http://qiita.com/hnakamur/items/0b72590136cece29faee
FROM typista/nginx-lua
#FROM typista/nginx-lua:0.7
# install php
RUN yum update -y && \
	yum install -y php-cgi php-mysql && \
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    rpm -Uvh epel-release-6*.rpm && \
    yum install --enablerepo=epel -y spawn-fcgi && \
    cd /etc/init.d/ && \
    wget http://sakuratan.biz/nginx/php-fastcgi && \
    chmod +x php-fastcgi && \
    mkdir -p /var/run/nginx/ && \
	wget https://raw.githubusercontent.com/typista/docker-nginx-php-libmysql/master/files/entrypoint.sh -O /etc/entrypoint.sh && \
	chmod +x /etc/entrypoint.sh
#EXPOSE 80
#ENTRYPOINT /etc/services.sh

