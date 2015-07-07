#!/bin/bash
vsftpd_username="$1"
vsftpd_userpass="$2"
vsftpd_pwd_file="/etc/vsftpd/virtual_user.passwd"

# Main
case $1 in
    $1)
        htpasswd -bcd $vsftpd_pwd_file $vsftpd_username $vsftpd_userpass
        echo
        echo "User Name          : $vsftpd_username"
        echo "User Passwd        : $vsftpd_userpass"
        echo "Encrypted Password : `grep $vsftpd_username $vsftpd_pwd_file | cut -d ':' -f 2`"
    ;;

    *)
        echo "Usage: $0 [USERNAME] [PASSWORD]"
    ;;
esac
