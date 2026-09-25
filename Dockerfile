FROM node:20-alpine
WORKDIR /app
COPY package.json ./
COPY index.js ./
CMD ["node", "-e", "console.log(require('./index').additionner(2, 3))"]

Puis .github/workflows/image.yml, à compléter :

name: Image

on:
  push:
    branches: [main]

permissions:
  contents: read
  ____: write                   # le droit d'écrire dans le registre de paquets GitHub

jobs:
  image:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: docker/setup-buildx-action@v3

      - uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.____ }}        # le jeton automatique, vu à l'étape 3

      - uses: docker/build-push-action@v6
        with:
          context: .
          push: true
          tags: ghcr.io/${{ github.repository }}:${{ ____ }}    # le SHA du commit
          cache-from: type=gha
          cache-to: type=gha,mode=max