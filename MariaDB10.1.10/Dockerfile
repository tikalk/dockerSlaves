# This Dockerfile is used to build an image containing MariaDB 10.1.10 based on Centos7Java7

FROM arm-jenkins-slave-centos67:1.0
MAINTAINER Amos Sonnenwirth <amoss@tikalk.com>

ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
ADD mariadb.sql /root/mariadb.sql
ADD server.cnf /etc/my.cnf.d/server.cnf
ADD mariadb.sh /root/mariadb.sh
ADD start.sh /root/start.sh

RUN yum install -y arm-build-server MariaDB-server
RUN yum clean all
RUN chmod +x /root/mariadb.sh
RUN chmod +x /root/start.sh

RUN /root/mariadb.sh

ENV TERM xterm

EXPOSE 3306 

CMD /root/start.sh
 

