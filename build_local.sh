#!/bin/bash

VERSION="1.1.5"

echo "Building Docker image peez/antigravity-cli:${VERSION}..."

docker build --build-arg TARGETARCH=amd64 --build-arg antigravity_version="${VERSION}" -t peez/antigravity-cli:latest -t peez/antigravity-cli:"${VERSION}" .

echo "Build complete."
