# This Dockerfile is used to build an image containing MariaDB 10.1.10 based on Centos7Java7

FROM arm-jenkins-slave-centos67:latest
MAINTAINER Amos Sonnenwirth <amoss@tikalk.com>

 ADD mariadb.repo /etc/yum.repos.d/mariadb.repo
 ADD mariadb.sql /root/mariadb.sql
 ADD server.cnf /etc/my.cnf.d/server.cnf
 ADD mariadb.sh /root/mariadb.sh

 RUN yum install -y arm-build-server MariaDB-server
 RUN yum clean all
 RUN chmod +x /root/mariadb.sh

 EXPOSE 3306

 CMD ["/root/mariadb.sh"]
 
 # Standard SSH port
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
