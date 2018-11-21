#!/bin/sh
echo -ne "Launching sshd..."
/usr/sbin/sshd &
echo -ne "OK\n"
echo -ne "Launching docker..."
DOCKERSOCK="/var/run/docker.sock"
screen -d -m dockerd -H tcp://0.0.0.0:2375 -H unix://$DOCKERSOCK
until [ -S $DOCKERSOCK ]; do sleep 1; done
echo -ne "OK\n"

DIR="/mnt"
if [ -z "$REPONAME" ]; then
    echo "REPONAME is not defined, sleeping forever..."
    #busybox sleep does not have infinity, so using that trick
    tail -f /dev/null
else
    #todo: test if there if a Dockerfile is present
    echo "REPONAME is defined as $REPONAME, trying to build it..."
    cd $DIR/$REPONAME
    docker build .
fi
