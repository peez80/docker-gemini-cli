#!/bin/bash
docker run -it -v ${HOME}/.gemini/antigravity-cli:/root/.gemini/antigravity-cli \
    peez/antigravity-cli:latest "$@"