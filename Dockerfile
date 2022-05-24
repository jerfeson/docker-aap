FROM amazonlinux:2

COPY systemctl.py /tmp/systemctl.py
COPY server-config.sh /tmp/server-config.sh
COPY start-servers.sh /usr/sbin/start-servers

RUN yum -y update && yum -y install shadow-utils yum-utils make gcc openssl-devel httpd \
    && yum-config-manager

RUN yum install -y amazon-linux-extras
RUN amazon-linux-extras enable php7.3

#configure time zone
RUN ln -f -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

#Intall utilites
RUN yum -y install vim wget git && yum -y groupinstall "Development Tools"

#Install apache
RUN yum install -y httpd
RUN yum install -y php php-{devel,cli,mcrypt,pdo,redis,soap,xmlrpc,pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip}

RUN mv /tmp/systemctl.py /usr/bin/systemctl && chmod 755 /usr/bin/systemctl
RUN /bin/bash /tmp/server-config.sh && rm /tmp/server-config.sh

EXPOSE 80

CMD /usr/bin/env bash start-servers;sleep infinity

#ENTRYPOINT ["/usr/sbin/httpd","-D","FOREGROUND"]