# Nutze ein stabiles Node-Image
FROM node:25

ARG gemini_version

# Installiere die Gemini CLI global
RUN npm install -g @google/gemini-cli@${gemini_version}

# Arbeitsverzeichnis für deine Dokumente
WORKDIR /apps

# Starte die CLI standardmäßig
ENTRYPOINT ["gemini"]
