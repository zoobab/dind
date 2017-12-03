#!/bin/sh
/usr/sbin/sshd &
dockerd &
# busybox sleep does not have infinity, so using that trick
tail -f /dev/null
