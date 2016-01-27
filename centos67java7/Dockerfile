# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
# It is based on instructions from https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin and Dockerfile 
# from https://hub.docker.com/r/evarga/jenkins-slave/

FROM centos:6.7
MAINTAINER Haggai Philip Zagury <hagzag@tikalk.com>

# Install a basic SSH server GIT, UNZIP, LSOF and JDK 8
RUN yum install -y openssh-server git unzip lsof && yum clean all
# now install java 7 from oracle
RUN yum -y install wget && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u75-b13/jdk-7u75-linux-x64.rpm && \
    echo "53b8513548ae527d79899902524a06e1  jdk-7u75-linux-x64.rpm" >> MD5SUM && \
    md5sum -c MD5SUM && \
    rpm -Uvh jdk-7u75-linux-x64.rpm && \
    yum -y remove wget && \
    rm -f jdk-7u75-linux-x64.rpm MD5SUM
# update sshd settings, create jenkins user, set jenkins user pw, generate ssh keys
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
    && mkdir -p /var/run/sshd \
    && useradd -u 1000 -m -s /bin/bash jenkins \
    && echo "jenkins:jenkins" | chpasswd \
    && /usr/bin/ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && echo export JAVA_HOME="/`alternatives  --display java | grep best | cut -d "/" -f 2-6`" >> /etc/environment

# Standard SSH port
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
