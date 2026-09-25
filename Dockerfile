FROM node:20-alpine
WORKDIR /app
COPY package.json ./
COPY index.js ./
CMD ["node", "-e", "console.log(require('./index').additionner(2, 3))"]