#!/bin/sh
#echo -ne "Launching sshd..."
#/usr/sbin/sshd &
#echo -ne "OK\n"
echo -ne "Launching docker..."
screen -d -m dockerd
DOCKERSOCK="/var/run/docker.sock"
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
