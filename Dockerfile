# 
# Dockerfile - vsftpd
#
# - Build
# docker build --rm -t vsftpd:3.0.2 /root/docker/production/vsftpd
#
# - Run
# docker run -d --name="vsftpd" -h "vsftpd" -p 21:21 -v /home:/home -v /tmp:/tmp -v /var/log:/var/log vsftpd:3.0.2
#
# - SSH
# ssh `docker inspect -f '{{ .NetworkSettings.IPAddress }}' vsftpd`

FROM     ubuntu:14.04
MAINTAINER Yongbok Kim <ruo91@yongbok.net>

# Repo
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list

# Last Package Update & Install
RUN apt-get update ; apt-get install -y vsftpd libpam-pwdfile apache2-utils supervisor openssh-server
RUN mkdir /etc/vsftpd \
 && mkdir -p /var/run/vsftpd/empty \
 && useradd --home /home --gid nogroup -m --shell /bin/false vsftpd
ADD conf/vsftpd.pam				/etc/pam.d/vsftpd
ADD conf/vsftpd.conf				/etc/vsftpd.conf
ADD conf/vsftp_virtual_user.sh			/opt/vsftp_virtual_user.sh
RUN chmod 755 /opt/vsftp_virtual_user.sh

# Supervisor
RUN mkdir -p /var/log/supervisor
ADD conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# SSH
RUN mkdir /var/run/sshd
RUN sed -i 's/without-password/yes/g' /etc/ssh/sshd_config
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# Set the root password for ssh
RUN echo 'root:vsftpd' |chpasswd

# Port
EXPOSE 21 22

# Daemon
CMD ["/usr/bin/supervisord"]
