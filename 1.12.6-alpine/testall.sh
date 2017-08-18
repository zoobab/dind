#!/bin/bash
set -e
./build.sh
./run-local.sh
./testssh.sh
