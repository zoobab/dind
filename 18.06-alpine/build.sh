#!/bin/bash
set -e
source config
docker build -t dind:$TAG .
