#!/bin/bash
set -e

for i in *-*/; do
    echo -ne "Testing ssh on $i ..."
        pushd $i >> /dev/null
        ./testssh.sh >> /dev/null
        popd >> /dev/null
    echo -ne "[OK]\n"
done
