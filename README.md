# Dockerfile - VSFTPD

### Git clone

```sh
# git clone https://github.com/ruo91/docker-vsftpd /opt
```

### Build

```sh
# docker build --rm -t vsftpd:3.0.2 /opt/docker-vsftpd
```

### Run

```sh
# docker run -d --name="vsftpd" -h "vsftpd" \
-p 21:21 -v /data/ftpdata:/home -v /tmp:/tmp vsftpd:3.0.2
```

### To persist user list:

```sh
# docker run -d --name="vsftpd" -h "vsftpd" \
-p 21:21 -v /data/ftpdata:/home -v /data/ftpconfig:/etc/vsftpd/ -v /tmp:/tmp vsftpd:3.0.2
```

### Create a virtual user
```sh
# mkdir /data/ftpdata/ruo91 
# docker exec vsftpd vsftpd_vuser.sh ruo91 123456
Adding password for user ruo91

User Name          : ruo91
User Passwd        : 123456
Encrypted Password : Ud5pGuwwK3UbI
```

### Test
![FileZilla Client][1]
[1]: http://cdn.yongbok.net/ruo91/img/docker/vsftpd/docker-vsftpd-filezilla-client.png
