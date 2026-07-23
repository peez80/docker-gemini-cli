# Nutze ein stabiles Ubuntu-Image
FROM ubuntu:24.04

# Installiere curl, ca-certificates und Docker-in-Docker Paket-Abhängigkeiten
RUN apt-get update && apt-get install -y curl ca-certificates docker.io iptables iproute2 && rm -rf /var/lib/apt/lists/*

ARG antigravity_version=1.1.5
ARG TARGETARCH=amd64

# Installiere Docker Compose V2
RUN if [ "$TARGETARCH" = "amd64" ]; then COMPOSE_ARCH="x86_64"; else COMPOSE_ARCH="aarch64"; fi && \
    mkdir -p /usr/libexec/docker/cli-plugins /usr/local/lib/docker/cli-plugins && \
    curl -fsSL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-${COMPOSE_ARCH}" -o /usr/libexec/docker/cli-plugins/docker-compose && \
    chmod +x /usr/libexec/docker/cli-plugins/docker-compose && \
    ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/local/lib/docker/cli-plugins/docker-compose && \
    ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/local/bin/docker-compose


# Configure Docker daemon to use vfs storage driver for Docker-in-Docker support
RUN mkdir -p /etc/docker && \
    echo '{\n  "storage-driver": "vfs"\n}' > /etc/docker/daemon.json

# Installiere die Antigravity CLI
RUN if [ "$TARGETARCH" = "amd64" ]; then ARCH="x64"; else ARCH="$TARGETARCH"; fi && \
    curl -fsSL "https://github.com/google-antigravity/antigravity-cli/releases/download/${antigravity_version}/agy_cli_linux_${ARCH}.tar.gz" -o agy.tar.gz && \
    mkdir -p agy_tmp && \
    tar -xzf agy.tar.gz -C agy_tmp && \
    BINARY=$(find agy_tmp -type f -size +1M | head -n 1) && \
    mv "$BINARY" /usr/local/bin/agy && \
    chmod +x /usr/local/bin/agy && \
    rm -rf agy_tmp agy.tar.gz

# Arbeitsverzeichnis für deine Dokumente
WORKDIR /apps

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Starte die CLI standardmäßig
ENTRYPOINT ["/entrypoint.sh"]
