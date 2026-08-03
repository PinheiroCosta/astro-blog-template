# AI Agent Guidelines

## Purpose

This document defines the development standards that AI agents must follow when contributing to this repository.
Its purpose is to ensure code consistency, maintainability, and a predictable development workflow, regardless of the AI tool being used.

## Project Overview

This project is a reusable Astro template for static blogs.

### Stack

- Astro
- TypeScript
- Docker
- Docker Compose
- Cloudflare Pages
- Cloudflare R2

Docker is the official development environment.

## Development Philosophy

- Prefer small, incremental changes.
- Large features should be split into multiple independent Pull Requests whenever possible.
- Infrastructure should be introduced gradually, validating each tool before integrating it with the next one.
- Favor simple, reviewable changes over large refactorings.
- Do not introduce unrelated improvements while implementing a feature.

## Architecture Principles

When making changes:

- Keep components reusable.
- Keep responsibilities well separated.
- Avoid unnecessary abstractions.
- Avoid premature optimization.
- Prefer explicit code over clever code.
- Minimize external dependencies.
- Preserve the existing project structure whenever possible.

## Development Workflow

Unless explicitly instructed otherwise:

1. Work on a single issue at a time.
2. Keep Pull Requests focused.
3. Do not combine unrelated changes.
4. Keep commits logically separated.
5. Preserve backward compatibility whenever possible.

## Coding Standards

Always follow the project's configured tools.

### Formatting

- Prettier is the source of truth for formatting.
- Never manually reformat code differently from Prettier.

### Linting

- Respect all ESLint rules.
- Do not disable lint rules unless explicitly justified.

### General

- Prefer readable code.
- Avoid duplication.
- Remove dead code.
- Keep files organized.
- Do not modify generated files manually unless required.

## Validation

Before considering a task complete, ensure the project passes its validation commands.
Typical commands include:

```bash
make lint
make format-check
make astro-check
```

If the task affects production behavior, also validate:

```bash
make build-app
```

## Commit Convention

Follow Conventional Commits.

Examples:

- feat:
- fix:
- docs:
- build:
- refactor:
- test:
- chore:

Each commit should represent a single logical change.
Avoid mixing formatting, refactoring and feature implementation in the same commit whenever possible.

## Pull Requests

Pull Requests should:

- solve a single problem;
- remain reasonably small;
- include a clear description;
- reference the related issue when applicable;
- pass all validation checks.

Do not include unrelated modifications.

## Documentation

Whenever a change affects:

- architecture;
- tooling;
- development workflow;
- coding conventions;
- onboarding;

evaluate whether the following documentation should also be updated:

- README.md
- Wiki
- AGENTS.md

Documentation is considered part of the implementation.

## Communication

### Language

Use English for:

- source code;
- identifiers;
- branch names;
- commit messages;
- documentation filenames.

Use Brazilian Portuguese (pt-BR) for:

- Pull Request reviews;
- code review comments;
- explanations provided to contributors;
- onboarding instructions, unless explicitly requested otherwise.

## Things to Avoid

Do not:

- introduce unnecessary dependencies;
- perform large refactorings unrelated to the task;
- modify files outside the scope of the issue;
- disable validations without justification;
- bypass linting or formatting rules;
- change project architecture without discussion.

## Priority Order

When instructions conflict, follow this priority:

1. Direct instructions from repository maintainers.
2. Issue requirements.
3. This document.
4. Existing project conventions.
5. Personal preferences.

Always prefer consistency with the existing project over introducing new patterns.
