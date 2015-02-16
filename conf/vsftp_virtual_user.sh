#!/bin/bash
# User
echo -ne "New user name: "
read user_id

# Create passwd file
vsftpd_dir=/etc/vsftpd
vsftpd_conf=$vsftpd_dir/virtual_user.passwd
htpasswd -cd $vsftpd_conf $user_id
