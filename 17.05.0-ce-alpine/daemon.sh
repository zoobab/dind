#!/bin/sh

GITCOMMIT="$(docker version --format '{{.Server.GitCommit}}')"
echo GITCOMMIT is $GITCOMMIT

echo "Killing docker..."
killall dockerd
sleep 10

echo "Replacing string in docker and dockerd..."
sed -i "s/$GITCOMMIT/deadbee/g" /usr/bin/docker
sed -i "s/$GITCOMMIT/deadbee/g" /usr/bin/dockerd

echo "Starting docker..."
dockerd &
sleep 10

SERVER_GITCOMMIT="$(docker version --format '{{.Server.GitCommit}}')"
CLIENT_GITCOMMIT="$(docker version --format '{{.Server.GitCommit}}')"
if [[ "$SERVER_GITCOMMIT" -ne "deadbee" ]] && [[ "$CLIENT_GITCOMMIT" -ne "deadbee" ]]; then
    echo "Docker replacement of git commit hash failed"
    exit 1
else
    echo "OK, Docker client and server both contain deadbee"
fi
