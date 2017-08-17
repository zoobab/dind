#!/bin/bash
chmod 600 id_rsa
ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i id_rsa root@127.0.0.1 -p1705 "docker ps >> /dev/null"
if [[ $? -eq 0 ]]; then
    echo "OK, SSH+Docker test succeeded"
else
    echo "ERROR, SSH+Docker test failed!!!"
fi
