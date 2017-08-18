#!/bin/sh
/usr/sbin/sshd &
docker daemon &
# busybox sleep does not have infinity, so using that trick
tail -f /dev/null
