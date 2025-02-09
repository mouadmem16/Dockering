#!/bin/sh
ssh-keygen -A
service vsftpd start
exec /usr/sbin/sshd -D -e "$@"
