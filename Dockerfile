# 1. Utilisation de l’image officielle de Node.js basée sur Alpine (léger et rapide)
FROM node:18-alpine

# 2. Définir le répertoire de travail dans le conteneur
WORKDIR /app

# 3. Copier uniquement package.json et package-lock.json pour optimiser la mise en cache
COPY package.json package-lock.json ./

# 4. Installer les dépendances
RUN npm install

# 5. Copier l’ensemble du projet dans le conteneur
COPY . .

# 6. Construire l’application Next.js
RUN npm run build

# 7. Exposer le port utilisé par Next.js
EXPOSE 3000

# 8. Démarrer l’application en mode production
CMD ["npm", "run", "start"]
