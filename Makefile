.PHONY: build up down clean rebuild shell logs lint format format-check build-app astro-check setup

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

clean:
	docker compose down --rmi local -v
	rm -rf .astro
	rm -rf node_modules

rebuild: clean build up

shell:
	docker compose exec app sh

logs:
	docker compose logs -f

lint:
	@if docker compose ps --status running app | grep -q app; then \
		docker compose exec -T app npm run lint; \
	else \
		docker compose run --rm app npm run lint; \
	fi

format:
	docker compose exec app npm run format

format-check:
	docker compose exec app npm run format:check

build-app:
	docker compose exec app npm run build

astro-check:
	docker compose exec app npm run astro check

setup:
	@echo "Configurando hooks do Git..."
	git config core.hooksPath .husky/
	@echo "Hooks configurados com sucesso."
