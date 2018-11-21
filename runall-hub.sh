#!/bin/bash
set -e

for i in *-*/; do
    echo -ne "Launching $i ..."
        pushd $i >> /dev/null
        ./run-hub.sh >> /dev/null
        popd >> /dev/null
    echo -ne "[OK]\n"
done
