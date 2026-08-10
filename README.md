# Astro Blog Template

[![Quality](https://github.com/PinheiroCosta/astro-blog-template/actions/workflows/quality.yml/badge.svg?branch=main)](https://github.com/PinheiroCosta/astro-blog-template/actions/workflows/quality.yml)
[![Build](https://github.com/PinheiroCosta/astro-blog-template/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/PinheiroCosta/astro-blog-template/actions/workflows/build.yml)

Uma base moderna para criação de sites estáticos utilizando Astro, TypeScript e Cloudflare.

Embora tenha surgido como um template para blogs, o projeto foi concebido para evoluir como uma plataforma reutilizável para diferentes tipos de presença digital, como:

- Blogs
- Portfólios profissionais
- Landing Pages
- Sites institucionais
- Pequenos negócios
- Catálogos de produtos e serviços

O objetivo é oferecer uma solução rápida, segura, de baixo custo operacional e simples de manter.

---

## Tecnologias

- Astro
- TypeScript
- Docker
- Cloudflare Pages
- Cloudflare R2 _(em desenvolvimento)_

---

## Objetivos do projeto

Este projeto busca:

- servir como base para múltiplos tipos de sites estáticos;
- reduzir o custo de desenvolvimento de novos projetos;
- facilitar a colaboração entre desenvolvedores;
- aplicar boas práticas de Engenharia de Software;
- permitir implantação simples utilizando Cloudflare.

---

## Pré-requisitos

São necessários apenas:

- Git
- Docker
- Docker Compose

> Não é necessário instalar Node.js, npm ou Astro na máquina host.

---

## Desenvolvimento

Construa a imagem:

```bash
docker compose build
```

Inicie o ambiente:

```bash
docker compose up
```

A aplicação estará disponível em:

```
http://localhost:4321
```

---

## Reconstrução completa

Caso seja necessário recriar completamente o ambiente:

```bash
docker compose down -v
docker image rm astro-blog-template-app

rm -rf node_modules
rm -rf .astro

docker compose build
docker compose up
```

---

## Roadmap

- [x] Ambiente Docker para desenvolvimento
- [x] Estrutura inicial do projeto
- [ ] Componentes reutilizáveis
- [ ] Sistema de navegação
- [ ] Layout base
- [ ] Suporte ao Cloudflare R2
- [ ] Pipeline de CI/CD
- [ ] Deploy automatizado
- [ ] Templates para diferentes tipos de sites

---

## Licença

Este projeto é distribuído sob a licença MIT.
