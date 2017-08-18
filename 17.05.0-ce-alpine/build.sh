#!/bin/bash
set -e
source config
docker build -t zoodind:$TAG .
