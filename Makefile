# ==============================================================================
#  PHONY TARGETS
# ==============================================================================
.PHONY: \
	build up down clean rebuild shell logs \
	setup \
	run \
	lint format format-check astro-check build-app pre-commit

# ==============================================================================
# ENVIRONMENT
# ==============================================================================

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

rebuild: clean build up

clean:
	docker compose down --rmi local -v
	rm -rf .astro
	rm -rf node_modules

shell:
	docker compose exec app sh

logs:
	docker compose logs -f

# ==============================================================================
# PROJECT SETUP
# ==============================================================================

setup:
	@echo "Configurando hooks do Git..."
	git config core.hooksPath .husky/
	@echo "Hooks configurados com sucesso."

# ==============================================================================
# QUALITY
# ==============================================================================

lint:
	$(MAKE) run CMD="npm run lint"

format:
	$(MAKE) run CMD="npm run format"

format-check:
	$(MAKE) run CMD="npm run format:check"

astro-check:
	$(MAKE) run CMD="npm run astro check"

pre-commit:
	$(MAKE) run CMD="npm run pre-commit"

# Executa todas as verificações de qualidade utilizando o mesmo ambiente
# do servidor de desenvolvimento. O Astro/Vite mantém caches internos que
# podem gerar conflitos de permissão quando executados com UID/GID do host.
check:
	$(DOCKER_EXEC_APP) npm run check

# ==============================================================================
# BUILD
# ==============================================================================

build-app:
	$(MAKE) run CMD="npm run build"

# ==============================================================================
# INTERNAL
# ==============================================================================
UID := $(shell id -u)
GID := $(shell id -g)

APP_SERVICE := app

DOCKER_EXEC_APP = docker compose exec -T $(APP_SERVICE)

DOCKER_EXEC = docker compose exec -T \
    --user $(UID):$(GID) \
    $(APP_SERVICE)

DOCKER_RUN = docker compose run --rm \
    --user $(UID):$(GID) \
    $(APP_SERVICE)

# Executa um comando dentro do container da aplicação.
#
# Se o ambiente já estiver em execução, utiliza `docker compose exec`
# para maior desempenho. Caso contrário, cria um container temporário
# utilizando `docker compose run --rm`.
#
# Essa abstração permite que comandos do projeto funcionem
# independentemente do estado atual do ambiente Docker.
#
# Exemplo:
#   make run CMD="npm run lint"

run:
	@if docker compose ps --status running app | grep -q app; then \
		$(DOCKER_EXEC) $(CMD); \
	else \
		$(DOCKER_RUN) $(CMD); \
	fi
