#!/bin/bash
docker run -d -p 1705:22 --privileged --name dind dnd:17.05.0-ce-alpine
