#!/bin/bash
docker run -it \
    -v ${HOME}/.gemini/antigravity-cli:/root/.gemini/antigravity-cli \
    -v $(pwd):/apps \
    -v antigravity-cli-dind-data:/var/lib/docker \
    --privileged \
    peez/antigravity-cli:latest "$@"
