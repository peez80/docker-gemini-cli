#!/bin/bash
docker run -it \
    -v ${HOME}/.gemini/antigravity-cli:/root/.gemini/antigravity-cli \
    -v ${HOME}/testfiles:/apps/testfiles \
    peez/antigravity-cli:latest "$@"