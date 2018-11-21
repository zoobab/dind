#!/bin/bash
set -e
./build.sh
./run-local.sh
sleep 5
./testssh.sh
sleep 5
./testtcp.sh
