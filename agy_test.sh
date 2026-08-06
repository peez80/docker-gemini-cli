#!/bin/bash
docker run -it --privileged \
    -v ${HOME}/.gemini/antigravity-cli:/root/.gemini/antigravity-cli \
    -v ${HOME}/testfiles:/apps/testfiles \
    --privileged \
    peez/antigravity-cli:latest "$@"
