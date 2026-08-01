#!/bin/bash

# Starte den Docker-Daemon im Hintergrund für Docker-in-Docker (DinD)
if command -v dockerd >/dev/null 2>&1; then
    dockerd --mtu=1350 >/var/log/dockerd.log 2>&1 &

    # Warte bis der Docker Socket bereit ist (max. 10 Sekunden)
    for i in {1..20}; do
        if docker info >/dev/null 2>&1; then
            break
        fi
        sleep 0.5
    done
fi

exec agy "$@"
