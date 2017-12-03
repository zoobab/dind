#!/bin/bash
source config
docker run --rm -d -p $SSH_PORT:22 --privileged --name dind-$TAG zoobab/dind:$TAG
