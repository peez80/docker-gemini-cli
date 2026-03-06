# Nutze ein stabiles Node-Image
FROM node:22-slim

# Installiere die Gemini CLI global
RUN npm install -g @google/gemini-cli@0.31.0

# Arbeitsverzeichnis für deine Dokumente
WORKDIR /apps

# Starte die CLI standardmäßig
ENTRYPOINT ["gemini"]