# Nutze ein stabiles Node-Image
FROM node:25

ARG gemini_version

RUN apt-get update && apt-get install -y libsecret-1-0 && rm -rf /var/lib/apt/lists/*

# Erzeuge die fehlende Machine-ID
RUN mkdir -p /var/lib/dbus && \
    dbus-uuidgen > /var/lib/dbus/machine-id && \
    ln -sf /var/lib/dbus/machine-id /etc/machine-id

# Installiere die Gemini CLI global
RUN npm install -g @google/gemini-cli@${gemini_version}

# Arbeitsverzeichnis für deine Dokumente
WORKDIR /apps

# Starte die CLI standardmäßig
ENTRYPOINT ["gemini"]
