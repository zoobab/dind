#!/bin/bash
source config
TCP_PORT="${SSH_PORT}0"

docker -H tcp://127.0.0.1:$TCP_PORT ps >> /dev/null
if [[ $? -eq 0 ]]; then
    echo "OK, Docker TCP test succeeded"
else
    echo "ERROR, Docker TCP test failed!!!"
fi
