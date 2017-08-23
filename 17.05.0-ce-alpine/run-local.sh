#!/bin/bash
set -x
source config
docker run --rm -d -p $SSH_PORT:22 --privileged --name zoodind-$TAG zoodind:$TAG
