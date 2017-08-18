#!/bin/bash
for i in `seq 100`; do mknod /dev/loop$i b 7 $i; done
/etc/init.d/ssh start
/etc/init.d/docker start
tail -f /dev/null
