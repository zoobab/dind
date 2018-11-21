#!/bin/bash
source config
docker run --rm -d -p ${SSH_PORT}:22 -p ${SSH_PORT}0:2375 --privileged --name dind-$TAG dind:$TAG
