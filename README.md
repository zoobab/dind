About ZooDind
=============

ZooDinD means Zoobab's Docker-in-Docker.

It is based on Alpine Linux, Docker and SSH.

Usage
=====

Some basic commands on how to use it:

```
$ cd 17.05.0-ce-alpine
$ ./run.sh
7205cedb9aa6cd2d72410cf08f93035b895e60b063886d4baad3c12887ce7c60
$ ./testssh.sh
OK, SSH+Docker test succeeded
$ ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i id_rsa root@127.0.0.1 -p1705 docker version
Client:
 Version:      17.05.0-ce
 API version:  1.29
 Go version:   go1.8.1
 Git commit:   v17.05.0-ce
 Built:        Tue May 16 10:10:15 2017
 OS/Arch:      linux/amd64

Server:
 Version:      17.05.0-ce
 API version:  1.29 (minimum version 1.12)
 Go version:   go1.8.1
 Git commit:   v17.05.0-ce
 Built:        Tue May 16 10:10:15 2017
 OS/Arch:      linux/amd64
 Experimental: false
```
