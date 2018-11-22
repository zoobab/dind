About Dind
==========

DinD is Docker-in-Docker.

It is based on Alpine Linux, Docker and/or SSH.

It is useful to debug different versions of the Docker Daemon.

Usage
=====

## Basic usage

```
$ docker run --privileged zoobab/dind
Launching sshd...OK
Launching docker...OK
REPONAME is not defined, sleeping forever...
```

## Usage with Docker exec

Launch it now with a proper container name (--name mydind), and in background mode (-d):

```
$ docker run -d --privileged --name mydind zoobab/dind
3fbb35b81ea244324406bd0eb83e2e5b659a5f09eef3561548e74e995785457d
```

Then use docker exec:

```
$ docker exec mydind docker version
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.1
 Git commit:        d72f525745
 Built:             Wed Sep  5 20:39:22 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.1
  Git commit:       v18.06.1-ce
  Built:            Wed Sep  5 20:38:41 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```

Try to launch a busybox shell:

```
$ docker exec -it mydind docker run -it busybox /bin/sh
Unable to find image 'busybox:latest' locally
latest: Pulling from library/busybox
90e01955edcd: Pull complete
Digest: sha256:2a03a6059f21e150ae84b0973863609494aad70f0a80eaeb64bddd8d92465812
Status: Downloaded newer image for busybox:latest
/ #
```

## Usage with SSH

First, install the SSH keys in your $HOME/.ssh, this is done with the shell script:

```
$ ./installsshkeys.sh 
Copying config_dind to your /home/zoobab/.ssh/ ...[OK]
Copying id_rsa_dind to your /home/zoobab/.ssh/ ...[OK]
Copying id_rsa_dind.pub to your /home/zoobab/.ssh/ ...[OK]
```

Some basic commands on how to use it:

```
$ cd 17.05-alpine
$ ./run-local.sh
7205cedb9aa6cd2d72410cf08f93035b895e60b063886d4baad3c12887ce7c60
$ ./testssh.sh
OK, SSH+Docker test succeeded
$ ssh -F ~/.ssh/config_dind dind-1705 hostname
7205cedb9aa6
$ ssh -F ~/.ssh/config_dind dind-1705 docker version
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

## Usage with TCP

TODO: Document the usage with TCP here

Todo
====

* ~~add more docker versions: 1.12.6, 1.11.2~~
* add ubuntu based images
* ~~ssh dotconfig~~
* use a skel directory to make templates
* ~~commit suicide if the docker daemon is not running after a while~~
* be able to run as a oneliner: $ docker run -it dind:1.12.6 docker run -it alpine /bin/sh
* provide shell wrappers to replace the main docker binary (in /usr/local/bin for example)
* expose the TCP port of docker
* launch them all in one, with tests

Problems
========

* Docker Inc has removed all debs before v17.*: https://twitter.com/zoobab/status/898499634674507776
