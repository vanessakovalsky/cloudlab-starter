# Étape 1 : Image de base
FROM node:18-alpine

# Étape 2 : Dossier de travail
WORKDIR /usr/src/app

# Étape 3 : Copie des fichiers
COPY package*.json ./
RUN npm install --production

COPY . .

# Étape 4 : Exposition du port
EXPOSE 8080

# Étape 5 : Commande de lancement
CMD ["npm", "start"]
