#!/bin/bash
set -e
source config
chmod 600 id_rsa
ssh -F $SSH_CONFIG zoodind-$SSH_PORT "docker ps >> /dev/null"
if [[ $? -eq 0 ]]; then
    echo "OK, SSH+Docker test succeeded"
else
    echo "ERROR, SSH+Docker test failed!!!"
fi
