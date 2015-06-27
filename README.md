# Dockerfile - VSFTPD

### Git clone

```
# git clone https://github.com/ruo91/docker-vsftpd /opt
```

### Build

```
# docker build --rm -t vsftpd:3.0.2 /opt/docker-vsftpd
```

### Run

```
# docker run -d --name="vsftpd" -h "vsftpd" \
-p 21:21 -v /home:/home -v /tmp:/tmp vsftpd:3.0.2
```

### Create a virtual users
ssh password: vsftpd

```
# ssh `docker inspect -f '{{ .NetworkSettings.IPAddress }}' vsftpd`
```

```
# /opt/vsftp_virtual_user.sh
New user name: ruo91
New password: 123456
Re-type new password: 123456
Adding password for user ruo91
```

```
# grep ruo91 /etc/vsftpd/virtual_user.passwd
ruo91:kpNWblSJ9JqJs
```

### Test
![FileZilla Client][1]
[1]: http://cdn.yongbok.net/ruo91/img/docker/vsftpd/docker-vsftpd-filezilla-client.png
