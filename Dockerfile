# Nutze ein stabiles Node-Image
FROM node:25

# Installiere die Gemini CLI global
RUN npm install -g @google/gemini-cli@0.32.1

# Arbeitsverzeichnis für deine Dokumente
WORKDIR /apps

# Starte die CLI standardmäßig
ENTRYPOINT ["gemini"]