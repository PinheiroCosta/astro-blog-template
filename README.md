# astro-blog-template

Template para criação de blogs estáticos utilizando Astro e Cloudflare.

## Objetivo

Este repositório serve como base para projetos de blogs reutilizáveis.

Características:

- Astro
- TypeScript
- Docker para desenvolvimento
- Cloudflare Pages
- Cloudflare R2 (futuramente)

## Pré-requisitos

- Git
- Docker
- Docker Compose

> Não é necessário instalar Node.js ou Astro no host.

## Desenvolvimento

Construir a imagem:
`docker compose build`

Iniciar o ambiente:
`docker compose up`

A aplicação estará disponível em:
`http://localhost:4321`

## Reconstrução completa

Caso seja necessário recriar o ambiente do zero:

```bash
docker compose down -v
docker image rm astro-blog-template-app
rm -rf node_modules
rm -rf .astro

docker compose build
docker compose up
```
