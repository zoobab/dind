#!/bin/sh
/usr/sbin/sshd &
dockerd &

DOCKERSOCK="/var/run/docker.sock"
echo "Waiting until docker socker file ($DOCKERSOCK) is present..."
until [ -f $DOCKERSOCK ]; do sleep 1; done

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
