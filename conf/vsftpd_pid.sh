#!/bin/bash
#Update user id to match with mounted folder, pass the permission issue
sudo usermod -u $(stat -c "%u" /home) vsftpd

# Create an empty passwd file if it doesn't exit
[ -f /etc/vsftpd/vuser.passwd ] || touch /etc/vsftpd/vuser.passwd
#Deamon
/usr/bin/supervisord
