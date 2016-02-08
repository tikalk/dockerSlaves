#!/bin/bash
/usr/sbin/sshd -D &
/opt/activemq/bin/activemq start
/usr/bin/mysqld_safe