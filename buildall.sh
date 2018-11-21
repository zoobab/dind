#!/bin/bash
set -e

for i in *-*/; do
    echo -ne "Building $i ..."
        pushd $i >> /dev/null
        ./build.sh >> /dev/null
        popd >> /dev/null
    echo -ne "[OK]\n"
done
