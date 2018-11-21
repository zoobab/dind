#!/bin/bash

for i in *-*/; do
    echo -ne "Testing tcp on $i ..."
        pushd $i >> /dev/null
        ./testtcp.sh >> /dev/null
        popd >> /dev/null
    echo -ne "[OK]\n"
done
