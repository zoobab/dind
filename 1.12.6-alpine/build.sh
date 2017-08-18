#!/bin/bash
source config
docker build -t zoodind:$TAG .
