#!/bin/bash
#Update user id to match with mounted folder, pass the permission issue
sudo usermod -u $(stat -c "%u" /home) vsftpd
#Deamon
/usr/bin/supervisord
