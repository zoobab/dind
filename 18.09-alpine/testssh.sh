#!/bin/bash
source config
ssh -F $SSH_CONFIG dind-$SSH_PORT "docker version >> /dev/null"
if [[ $? -eq 0 ]]; then
    echo "OK, SSH+Docker test succeeded"
else
    echo "ERROR, SSH+Docker test failed!!!"
fi
