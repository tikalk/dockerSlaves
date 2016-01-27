# This Dockerfile is used to build an image containing MariaDB 10.1.10 based on Centos7Java7

FROM arm-jenkins-slave:latest
MAINTAINER Amos Sonnenwirth <amoss@tikalk.com>

ADD mariadb.repo /etc/yum.repos.d/mariadb.repo

 RUN yum install -y arm-build-server MariaDB-server
 RUN yum clean all

 EXPOSE 3306
